/**
 * @file    led_task.c
 * @brief   LED control task implementation using FreeRTOS.
 *
 * @version 1.0.0
 * @date    2025-11-08
 * @author  Kaan Alsancak
 */

/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "FreeRTOS.h"
#include "task.h"

/* Private variables ---------------------------------------------------------*/
/**
 * @brief Handle for the LED task.
 */
xTaskHandle xLedTaskHandle;

/* Private function prototypes -----------------------------------------------*/
/**
 * @brief  LED task function.
 * @param  Parameters: Pointer to task-specific parameters (unused).
 * @retval None
 */
static void prvLedTask(void *Parameters)
{
    (void)Parameters; /* Suppress unused parameter warning */

    for (;;)
    {
        HAL_GPIO_TogglePin(LD2_GPIO_Port, LD2_Pin);
        vTaskDelay(pdMS_TO_TICKS(500)); /**< Delay for 500 ms */
    }
}

/* Public functions ----------------------------------------------------------*/
/**
 * @brief  Creates the LED control task.
 * @retval None
 */
void vCreateLedTask(void)
{
    xTaskCreate(prvLedTask,            /**< Task function */
                "LED_TASK",            /**< Task name (for debug) */
                configMINIMAL_STACK_SIZE, /**< Stack size */
                NULL,                  /**< Task parameters */
                1,                     /**< Task priority */
                &xLedTaskHandle);      /**< Task handle reference */
}
