################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/audiosystem.cpp \
../src/fpscam.cpp \
../src/hahaha.cpp \
../src/mesh.cpp \
../src/model.cpp \
../src/plane.cpp \
../src/shader.cpp \
../src/stb_image.cpp \
../src/texture.cpp 

C_SRCS += \
../src/glad.c \
../src/miniaudio.c 

CPP_DEPS += \
./src/audiosystem.d \
./src/fpscam.d \
./src/hahaha.d \
./src/mesh.d \
./src/model.d \
./src/plane.d \
./src/shader.d \
./src/stb_image.d \
./src/texture.d 

C_DEPS += \
./src/glad.d \
./src/miniaudio.d 

OBJS += \
./src/audiosystem.o \
./src/fpscam.o \
./src/glad.o \
./src/hahaha.o \
./src/mesh.o \
./src/miniaudio.o \
./src/model.o \
./src/plane.o \
./src/shader.o \
./src/stb_image.o \
./src/texture.o 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.cpp src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C++ Compiler'
	g++ -I/usr/include -I"/home/parsey/eclipse-workspace/hahaha2/src" -I"/home/parsey/eclipse-workspace/hahaha2/include" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui/backends" -I"/home/parsey/eclipse-workspace/hahaha2/include/imgui" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/%.o: ../src/%.c src/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GCC C Compiler'
	gcc -I"/home/parsey/eclipse-workspace/hahaha2/include" -O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


clean: clean-src

clean-src:
	-$(RM) ./src/audiosystem.d ./src/audiosystem.o ./src/fpscam.d ./src/fpscam.o ./src/glad.d ./src/glad.o ./src/hahaha.d ./src/hahaha.o ./src/mesh.d ./src/mesh.o ./src/miniaudio.d ./src/miniaudio.o ./src/model.d ./src/model.o ./src/plane.d ./src/plane.o ./src/shader.d ./src/shader.o ./src/stb_image.d ./src/stb_image.o ./src/texture.d ./src/texture.o

.PHONY: clean-src

