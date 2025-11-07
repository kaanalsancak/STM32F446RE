################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/SystemView/SEGGER/SEGGER_RTT.c \
../Libs/SystemView/SEGGER/SEGGER_RTT_printf.c \
../Libs/SystemView/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
../Libs/SystemView/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./Libs/SystemView/SEGGER/SEGGER_RTT.o \
./Libs/SystemView/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./Libs/SystemView/SEGGER/SEGGER_RTT_printf.o \
./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./Libs/SystemView/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./Libs/SystemView/SEGGER/SEGGER_RTT.d \
./Libs/SystemView/SEGGER/SEGGER_RTT_printf.d \
./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/SystemView/SEGGER/%.o Libs/SystemView/SEGGER/%.su Libs/SystemView/SEGGER/%.cyclo: ../Libs/SystemView/SEGGER/%.c Libs/SystemView/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/include" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/Sample/FreeRTOSV11" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER/Syscalls" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/Segger" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/FreeRTOS" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/led" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Libs/SystemView/SEGGER/%.o: ../Libs/SystemView/SEGGER/%.S Libs/SystemView/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/Segger" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-Libs-2f-SystemView-2f-SEGGER

clean-Libs-2f-SystemView-2f-SEGGER:
	-$(RM) ./Libs/SystemView/SEGGER/SEGGER_RTT.cyclo ./Libs/SystemView/SEGGER/SEGGER_RTT.d ./Libs/SystemView/SEGGER/SEGGER_RTT.o ./Libs/SystemView/SEGGER/SEGGER_RTT.su ./Libs/SystemView/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./Libs/SystemView/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./Libs/SystemView/SEGGER/SEGGER_RTT_printf.cyclo ./Libs/SystemView/SEGGER/SEGGER_RTT_printf.d ./Libs/SystemView/SEGGER/SEGGER_RTT_printf.o ./Libs/SystemView/SEGGER/SEGGER_RTT_printf.su ./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.cyclo ./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.d ./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.o ./Libs/SystemView/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-Libs-2f-SystemView-2f-SEGGER

