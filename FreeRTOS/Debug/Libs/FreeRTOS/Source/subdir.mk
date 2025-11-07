################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libs/FreeRTOS/Source/croutine.c \
../Libs/FreeRTOS/Source/event_groups.c \
../Libs/FreeRTOS/Source/list.c \
../Libs/FreeRTOS/Source/queue.c \
../Libs/FreeRTOS/Source/stream_buffer.c \
../Libs/FreeRTOS/Source/tasks.c \
../Libs/FreeRTOS/Source/timers.c 

OBJS += \
./Libs/FreeRTOS/Source/croutine.o \
./Libs/FreeRTOS/Source/event_groups.o \
./Libs/FreeRTOS/Source/list.o \
./Libs/FreeRTOS/Source/queue.o \
./Libs/FreeRTOS/Source/stream_buffer.o \
./Libs/FreeRTOS/Source/tasks.o \
./Libs/FreeRTOS/Source/timers.o 

C_DEPS += \
./Libs/FreeRTOS/Source/croutine.d \
./Libs/FreeRTOS/Source/event_groups.d \
./Libs/FreeRTOS/Source/list.d \
./Libs/FreeRTOS/Source/queue.d \
./Libs/FreeRTOS/Source/stream_buffer.d \
./Libs/FreeRTOS/Source/tasks.d \
./Libs/FreeRTOS/Source/timers.d 


# Each subdirectory must supply rules for building sources it contributes
Libs/FreeRTOS/Source/%.o Libs/FreeRTOS/Source/%.su Libs/FreeRTOS/Source/%.cyclo: ../Libs/FreeRTOS/Source/%.c Libs/FreeRTOS/Source/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F446xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/include" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/FreeRTOS/Source/portable/GCC/ARM_CM4F" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/Sample/FreeRTOSV11" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER/Syscalls" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/Segger" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Libs/SystemView/SEGGER" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/FreeRTOS" -I"C:/Users/lenovo/Desktop/Git/STM32F446RE/FreeRTOS/Core/Modules/led" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libs-2f-FreeRTOS-2f-Source

clean-Libs-2f-FreeRTOS-2f-Source:
	-$(RM) ./Libs/FreeRTOS/Source/croutine.cyclo ./Libs/FreeRTOS/Source/croutine.d ./Libs/FreeRTOS/Source/croutine.o ./Libs/FreeRTOS/Source/croutine.su ./Libs/FreeRTOS/Source/event_groups.cyclo ./Libs/FreeRTOS/Source/event_groups.d ./Libs/FreeRTOS/Source/event_groups.o ./Libs/FreeRTOS/Source/event_groups.su ./Libs/FreeRTOS/Source/list.cyclo ./Libs/FreeRTOS/Source/list.d ./Libs/FreeRTOS/Source/list.o ./Libs/FreeRTOS/Source/list.su ./Libs/FreeRTOS/Source/queue.cyclo ./Libs/FreeRTOS/Source/queue.d ./Libs/FreeRTOS/Source/queue.o ./Libs/FreeRTOS/Source/queue.su ./Libs/FreeRTOS/Source/stream_buffer.cyclo ./Libs/FreeRTOS/Source/stream_buffer.d ./Libs/FreeRTOS/Source/stream_buffer.o ./Libs/FreeRTOS/Source/stream_buffer.su ./Libs/FreeRTOS/Source/tasks.cyclo ./Libs/FreeRTOS/Source/tasks.d ./Libs/FreeRTOS/Source/tasks.o ./Libs/FreeRTOS/Source/tasks.su ./Libs/FreeRTOS/Source/timers.cyclo ./Libs/FreeRTOS/Source/timers.d ./Libs/FreeRTOS/Source/timers.o ./Libs/FreeRTOS/Source/timers.su

.PHONY: clean-Libs-2f-FreeRTOS-2f-Source

