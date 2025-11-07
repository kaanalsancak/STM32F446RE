################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Core/Modules/FreeRTOS/freertos.c \
../Core/Modules/FreeRTOS/freertos_init.c 

OBJS += \
./Core/Modules/FreeRTOS/freertos.o \
./Core/Modules/FreeRTOS/freertos_init.o 

C_DEPS += \
./Core/Modules/FreeRTOS/freertos.d \
./Core/Modules/FreeRTOS/freertos_init.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Modules/FreeRTOS/%.o Core/Modules/FreeRTOS/%.su Core/Modules/FreeRTOS/%.cyclo: ../Core/Modules/FreeRTOS/%.c Core/Modules/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/include" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/Sample/FreeRTOSV11" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER/Syscalls" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/Segger" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/FreeRTOS" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/led" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Core-2f-Modules-2f-FreeRTOS

clean-Core-2f-Modules-2f-FreeRTOS:
	-$(RM) ./Core/Modules/FreeRTOS/freertos.cyclo ./Core/Modules/FreeRTOS/freertos.d ./Core/Modules/FreeRTOS/freertos.o ./Core/Modules/FreeRTOS/freertos.su ./Core/Modules/FreeRTOS/freertos_init.cyclo ./Core/Modules/FreeRTOS/freertos_init.d ./Core/Modules/FreeRTOS/freertos_init.o ./Core/Modules/FreeRTOS/freertos_init.su

.PHONY: clean-Core-2f-Modules-2f-FreeRTOS

