/**
 * @file    init_freeRTOS.h
 * @brief   FreeRTOS task initialization header file.
 *
 * @version 1.0.0
 * @date    2025-11-08
 * @author  Kaan Alsancak
 */

#ifndef MODULES_FREERTOS_INIT_FREERTOS_H_
#define MODULES_FREERTOS_INIT_FREERTOS_H_

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @brief  Initializes and creates all FreeRTOS tasks used in the application.
 * @retval None
 */
void vInitTasks(void);

#ifdef __cplusplus
}
#endif

#endif /* MODULES_FREERTOS_INIT_FREERTOS_H_ */
