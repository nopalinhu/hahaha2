################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/parsey/eclipse-workspace/hahaha/include/imgui/imgui.cpp \
/home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_draw.cpp \
/home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_tables.cpp \
/home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_widgets.cpp 

CPP_DEPS += \
./src/imgui/imgui.d \
./src/imgui/imgui_draw.d \
./src/imgui/imgui_tables.d \
./src/imgui/imgui_widgets.d 

OBJS += \
./src/imgui/imgui.o \
./src/imgui/imgui_draw.o \
./src/imgui/imgui_tables.o \
./src/imgui/imgui_widgets.o 


# Each subdirectory must supply rules for building sources it contributes
src/imgui/imgui.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/imgui.cpp src/imgui/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/imgui/imgui_draw.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_draw.cpp src/imgui/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/imgui/imgui_tables.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_tables.cpp src/imgui/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/imgui/imgui_widgets.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/imgui_widgets.cpp src/imgui/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-imgui

clean-src-2f-imgui:
	-$(RM) ./src/imgui/imgui.d ./src/imgui/imgui.o ./src/imgui/imgui_draw.d ./src/imgui/imgui_draw.o ./src/imgui/imgui_tables.d ./src/imgui/imgui_tables.o ./src/imgui/imgui_widgets.d ./src/imgui/imgui_widgets.o

.PHONY: clean-src-2f-imgui

