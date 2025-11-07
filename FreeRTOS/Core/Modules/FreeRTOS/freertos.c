/**
 * @file    freertos.c
 * @brief   Code for FreeRTOS applications
 * @note    -
 *
 * @version 1.0.0
 * @author  Kerem Zorer
 * @author  Pamir Mundt
 * @author  Kaan Alsancak
 *
 * @date    2025-XX-XX
 *
 * @see     -
 */

/* Includes ------------------------------------------------------------------*/
#include "FreeRTOS.h"
#include "task.h"
#include "main.h"

/* Private typedef -----------------------------------------------------------*/
extern TIM_HandleTypeDef htim6;

/* Private variables ---------------------------------------------------------*/
/* Timer tick counter for FreeRTOS stats */
#if( defined(configGENERATE_RUN_TIME_STATS) && defined(configUSE_STATS_FORMATTING_FUNCTIONS) && \
     defined(configSUPPORT_DYNAMIC_ALLOCATION) )
    #if( (configGENERATE_RUN_TIME_STATS == 1) && (configUSE_STATS_FORMATTING_FUNCTIONS > 0) && \
         (configSUPPORT_DYNAMIC_ALLOCATION == 1) )
/**
 *  Timer Tick counter for FreeRTOS Run-time Stats.
 *      -> APB1 Bus : 54Mhz
 *      -> TIM_CLK  : ( APB1 Bus ) x 2 = 108 Mhz
 *      Timer 6: TIM_CLK / ( TIM_PSC + 1 ) / ( TIM_ARR + 1 )
 *               200 MHz / ( 0 + 1 ) / ( 10799 + 1 ) = 10 kHz Sampling Rate
 *
 *      Sampling rate of stats will be x10 of the FreeRTOS tick interrupt
 *          - FreeRTOS Tick Rate:   1kHz
 *          - Sampling Rate:        10kHz
 *
 *      Counter is incremented inside Timer 7 IRQ
 */
volatile unsigned long ulStatsTimerTicks = 0UL;
    #endif
#endif

/* Private function prototypes -------------------------------------------------------------------*/
TaskHandle_t xGreenLedTaskStart(void);
void vGreenLedTask(void *pvParameters);

TaskHandle_t xRedLedTaskStart(void);
void vRedLedTask(void *pvParameters);

/* FreeRTOS Hook prototypes */
#if( defined(configGENERATE_RUN_TIME_STATS) && defined(configUSE_STATS_FORMATTING_FUNCTIONS) && \
     defined(configSUPPORT_DYNAMIC_ALLOCATION) )
    #if( (configGENERATE_RUN_TIME_STATS == 1) && (configUSE_STATS_FORMATTING_FUNCTIONS > 0) && \
         (configSUPPORT_DYNAMIC_ALLOCATION == 1) )
void configureTimerForRunTimeStats(void);
unsigned long getRunTimeCounterValue(void);
    #endif
#endif

#if( defined(configUSE_MALLOC_FAILED_HOOK) && (configUSE_MALLOC_FAILED_HOOK > 0) )
void vApplicationMallocFailedHook(void);
#endif

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief  FreeRTOS initialization
 * @param  None
 * @retval None
 */
void vFreeRTOS_Init(void) {
    /* Create the GreenLed task */
    xGreenLedTaskStart();
}

/*------------------------------------------------------------------------------------------------*/
#if( (configGENERATE_RUN_TIME_STATS == 1) && (configUSE_STATS_FORMATTING_FUNCTIONS > 0) && \
     (configSUPPORT_DYNAMIC_ALLOCATION == 1) )
/**
 * @brief Starts Timer X to periodically generate run-time statistics.
 *
 * This function is designed for the "Generate Run-Time Stats" feature and will be invoked by
 * FreeRTOS. It initializes the run-time statistics generation by starting the hardware timer
 * (Timer X) in interrupt mode.
 *
 * @param None
 * @retval None
 */
void configureTimerForRunTimeStats(void) {
    ulStatsTimerTicks = 0;
    HAL_TIM_Base_Start_IT(&htim6);
}

/**
 * @brief Retrieves the current tick count from Timer X.
 *
 * This function is essential for "Generate Run-Time Stats" feature, providing the current value
 * of the timer ticks since `configureTimerForRunTimeStats` was called. FreeRTOS utilizes this
 * value to calculate the run-time statistics.
 *
 * @param None
 * @retval unsigned long Returns the current tick count
 */
unsigned long getRunTimeCounterValue(void) {
    return ulStatsTimerTicks;
}
#endif

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief Provides memory for the Idle task in a statically allocated system
 *
 * @note !THIS FUNCTION WAS PROVIDED FROM FREERTOS. DO NOT EDIT!
 *
 * @note configSUPPORT_STATIC_ALLOCATION is set to 1, so the application must provide an
 *       implementation of vApplicationGetIdleTaskMemory() to provide the memory that is used by the
 *       Idle task.
 *
 * @param ppxIdleTaskTCBBuffer Double pointer to the task's control block buffer
 * @param ppxIdleTaskStackBuffer Double pointer to the task's stack buffer.
 * @param puxIdleTaskStackSize Pointer to the size of the stack.
 */
void vApplicationGetIdleTaskMemory(StaticTask_t **ppxIdleTaskTCBBuffer,
                                   StackType_t **ppxIdleTaskStackBuffer,
                                   uint32_t *puxIdleTaskStackSize) {
    /**
     * If the buffers to be provided to the Idle task are declared inside this function then they
     * must be declared static - otherwise they will be allocated on the stack and so not exists
     * after this function exits.
     */
    static StaticTask_t xIdleTaskTCB;
    static StackType_t uxIdleTaskStack[configMINIMAL_STACK_SIZE];

    /**
     * Pass out a pointer to the StaticTask_t structure in which the Idle task's state will be
     * stored.
     */
    *ppxIdleTaskTCBBuffer = &xIdleTaskTCB;

    /* Pass out the array that will be used as the Idle task's stack. */
    *ppxIdleTaskStackBuffer = uxIdleTaskStack;

    /**
     * Pass out the size of the array pointed to by *ppxIdleTaskStackBuffer.
     * Note that, as the array is necessarily of type StackType_t,
     * configMINIMAL_STACK_SIZE is specified in words, not bytes.
     */
    *puxIdleTaskStackSize = configMINIMAL_STACK_SIZE;
}

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief Supplies memory for the Timer service task in a system with static allocation.
 *
 * @note !THIS FUNCTION WAS PROVIDED FROM FREERTOS. DO NOT EDIT!
 *
 * @note configSUPPORT_STATIC_ALLOCATION and configUSE_TIMERS are both set to 1, so the application
 *       must provide an implementation of vApplicationGetTimerTaskMemory() to provide the memory
 *       that is used by the Timer service task.
 *
 * @param ppxTimerTaskTCBBuffer Double pointer to the Timer task's control block buffer.
 * @param ppxTimerTaskStackBuffer Double pointer to the Timer task's stack buffer.
 * @param puxTimerTaskStackSize Pointer to the stack size.
 */
void vApplicationGetTimerTaskMemory(StaticTask_t **ppxTimerTaskTCBBuffer,
                                    StackType_t **ppxTimerTaskStackBuffer,
                                    uint32_t *puxTimerTaskStackSize) {
    /**
     * If the buffers to be provided to the Timer task are declared inside this function then they
     * must be declared static - otherwise they will be allocated on the stack and so not exists
     * after this function exits.
     */
    static StaticTask_t xTimerTaskTCB;
    static StackType_t uxTimerTaskStack[configTIMER_TASK_STACK_DEPTH];

    /**
     * Pass out a pointer to the StaticTask_t structure in which the Timer task's state will be
     * stored.
     */
    *ppxTimerTaskTCBBuffer = &xTimerTaskTCB;

    /* Pass out the array that will be used as the Timer task's stack. */
    *ppxTimerTaskStackBuffer = uxTimerTaskStack;

    /**
     * Pass out the size of the array pointed to by *ppxTimerTaskStackBuffer.
     * Note that, as the array is necessarily of type StackType_t,
     * configTIMER_TASK_STACK_DEPTH is specified in words, not bytes.
     */
    *puxTimerTaskStackSize = configTIMER_TASK_STACK_DEPTH;
}

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief This function is called when a configASSERT() fails.
 *
 * This implementation logs the file name and line number where the assertion failed, then disables
 * interrupts and enters an infinite loop to halt the system. Modify this function to suit your
 * debugging and logging needs.
 *
 * @param pcFile The name of the source file where the assertion failed.
 * @param ulLine The line number in the source file where the assertion failed.
 */
void vAssertCalled(const char *pcFile, unsigned long ulLine) {
    (void) pcFile;
    (void) ulLine;
    /* Disable interrupts to stop the system */
    taskDISABLE_INTERRUPTS();
    /* Enter an infinite loop to halt the system */
    for( ;; ) {
        /**/
    }
}

/*------------------------------------------------------------------------------------------------*/

/**
 * @brief Handles stack overflow errors for FreeRTOS tasks.
 *
 * Called by FreeRTOS upon stack overflow detection.
 *
 * @param xTask Task handle that overflowed its stack.
 * @param pcTaskName Name of the task that overflowed its stack.
 */
#if( (defined(configCHECK_FOR_STACK_OVERFLOW)) && (configCHECK_FOR_STACK_OVERFLOW > 0) )
void vApplicationStackOverflowHook(TaskHandle_t xTask, char *pcTaskName) {
    (void) xTask;
    (void) pcTaskName;
    /* Run time stack overflow checking is performed if configCHECK_FOR_STACK_OVERFLOW is
     * defined to 1 or 2. This hook function is called if a stack overflow is detected. */

    /* Solid green or yellow on for error indication */
    __disable_irq();
    // TODO: Handle error
    // TODO: Use MPU + xTaskCreateRestricted
    while( 1 ) {
        ;
    }
}
#endif

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief Handles memory allocation failures in FreeRTOS.
 *
 * @note This function is invoked if the FreeRTOS heap allocation fails. Heap allocation failure
 *       handling is enabled by setting configUSE_MALLOC_FAILED_HOOK to 1 in FreeRTOSConfig.h.
 */
#if( defined(configUSE_MALLOC_FAILED_HOOK) && (configUSE_MALLOC_FAILED_HOOK > 0) )
void vApplicationMallocFailedHook(void) {
    /* Solid green or yellow on for error indication */
    __disable_irq();
    // TODO: Handle error
    // TODO: Use MPU + xTaskCreateRestricted
    while( 1 ) {
        ;
    }
}
#endif

/*------------------------------------------------------------------------------------------------*/
/* TODO: Clean this */
static TaskHandle_t xGreenLedTaskHandle;
static StaticTask_t xGreenLedTaskBuffer;
static StackType_t xGreenLedTaskStack[(configMINIMAL_STACK_SIZE * 4U)];

/**
 * @brief  Dummy task for Green LED blink which indicated that the system is running
 * @param  None
 * @return TaskHandle_t Handle to the created task.
 */
TaskHandle_t xGreenLedTaskStart(void) {
    xGreenLedTaskHandle = xTaskCreateStatic(
        vGreenLedTask,                    /* Pointer to the task entry function */
        "greenLed",                       /* A descriptive name for the task */
        (configMINIMAL_STACK_SIZE * 4U),  /* Stack Depth */
        NULL,                             /* Task parameter */
        tskIDLE_PRIORITY + 1,             /* Task priority */
        xGreenLedTaskStack,               /* Pointer to stack Buffer */
        &xGreenLedTaskBuffer);            /* Pointer to task buffer */
    // TODO: Handle NULL
    configASSERT(xGreenLedTaskHandle);
    return xGreenLedTaskHandle;
}

/*------------------------------------------------------------------------------------------------*/
/**
 * @brief Simple green LED task that toggles to indicate the system is running
 * @param pvParameters Unused
 */
void vGreenLedTask(void *pvParameters) {
    /* Suppress compiler warning */
    (void) pvParameters;
    for( ;; ) {
        /* Toggle green LED pin */
        HAL_GPIO_TogglePin(LD2_GPIO_Port, LD2_Pin);
        /* Delay for 1000 milliseconds */
        vTaskDelay(pdMS_TO_TICKS(1000));
    }
}


/*------------------------------------------------------------------------------------------------*/
