/**
 * @file    init_freeRTOS.c
 * @brief   FreeRTOS task initialization source file.
 * @version 1.0.0
 * @date    2025-11-08
 * @author  Kaan Alsancak
 */

/* Includes ------------------------------------------------------------------*/
#include "init_freeRTOS.h"
#include "main.h"
#include "FreeRTOS.h"
#include "task.h"
#include "led.h"

/* Private function prototypes -----------------------------------------------*/
/**
 * @brief  Initializes and creates all FreeRTOS application tasks.
 * @retval None
 */
void vInitTasks(void)
{
    /* Create LED control task */
    vCreateLedTask();
}
