################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.c 

OBJS += \
./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o 

C_DEPS += \
./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.o Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.su Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.cyclo: ../Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/%.c Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/include" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/Sample/FreeRTOSV11" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER/Syscalls" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/Segger" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/FreeRTOS" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/led" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F

clean-Libs-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F:
	-$(RM) ./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.cyclo ./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.d ./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.o ./Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F/port.su

.PHONY: clean-Libs-2f-FreeRTOS-2f-Source-2f-portable-2f-GCC-2f-ARM_CM4F

