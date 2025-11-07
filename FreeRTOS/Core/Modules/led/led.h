/**
 * @file    led.h
 * @brief   LED control task interface for FreeRTOS-based applications.
 * @version 1.0.0
 * @date    2025-11-08
 * @author  Kaan Alsancak
 */

#ifndef MODULES_LED_LED_H_
#define MODULES_LED_LED_H_

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief  Creates and initializes the LED control task.
 * @retval None
 */
void vCreateLedTask(void);

#ifdef __cplusplus
}
#endif

#endif /* MODULES_LED_LED_H_ */
