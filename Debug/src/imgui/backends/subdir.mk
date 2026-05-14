################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
/home/parsey/eclipse-workspace/hahaha/include/imgui/backends/imgui_impl_glfw.cpp \
/home/parsey/eclipse-workspace/hahaha/include/imgui/backends/imgui_impl_opengl3.cpp 

CPP_DEPS += \
./src/imgui/backends/imgui_impl_glfw.d \
./src/imgui/backends/imgui_impl_opengl3.d 

OBJS += \
./src/imgui/backends/imgui_impl_glfw.o \
./src/imgui/backends/imgui_impl_opengl3.o 


# Each subdirectory must supply rules for building sources it contributes
src/imgui/backends/imgui_impl_glfw.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/backends/imgui_impl_glfw.cpp src/imgui/backends/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/imgui/backends/imgui_impl_opengl3.o: /home/parsey/eclipse-workspace/hahaha/include/imgui/backends/imgui_impl_opengl3.cpp src/imgui/backends/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src-2f-imgui-2f-backends

clean-src-2f-imgui-2f-backends:
	-$(RM) ./src/imgui/backends/imgui_impl_glfw.d ./src/imgui/backends/imgui_impl_glfw.o ./src/imgui/backends/imgui_impl_opengl3.d ./src/imgui/backends/imgui_impl_opengl3.o

.PHONY: clean-src-2f-imgui-2f-backends

