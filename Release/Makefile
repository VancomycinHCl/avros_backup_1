################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL := cmd.exe
RM := rm -rf

USER_OBJS :=

LIBS := 
PROJ := 

O_SRCS := 
C_SRCS := 
S_SRCS := 
S_UPPER_SRCS := 
OBJ_SRCS := 
ASM_SRCS := 
PREPROCESSING_SRCS := 
OBJS := 
OBJS_AS_ARGS := 
C_DEPS := 
C_DEPS_AS_ARGS := 
EXECUTABLES := 
OUTPUT_FILE_PATH :=
OUTPUT_FILE_PATH_AS_ARGS :=
AVR_APP_PATH :=$$$AVR_APP_PATH$$$
QUOTE := "
ADDITIONAL_DEPENDENCIES:=
OUTPUT_FILE_DEP:=
LIB_DEP:=
LINKER_SCRIPT_DEP:=

# Every subdirectory with source files must be described here
SUBDIRS := 


# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS +=  \
../main.c \
../thread.c


PREPROCESSING_SRCS +=  \
../startup_thread.S \
../switch_threads.S


ASM_SRCS += 


OBJS +=  \
main.o \
startup_thread.o \
switch_threads.o \
thread.o

OBJS_AS_ARGS +=  \
main.o \
startup_thread.o \
switch_threads.o \
thread.o

C_DEPS +=  \
main.d \
startup_thread.d \
switch_threads.d \
thread.d

C_DEPS_AS_ARGS +=  \
main.d \
startup_thread.d \
switch_threads.d \
thread.d

OUTPUT_FILE_PATH +=2024_avros_ver0.elf

OUTPUT_FILE_PATH_AS_ARGS +=2024_avros_ver0.elf

ADDITIONAL_DEPENDENCIES:=

OUTPUT_FILE_DEP:= ./makedep.mk

LIB_DEP+= 

LINKER_SCRIPT_DEP+= 


# AVR32/GNU C Compiler
./main.o: .././main.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 5.4.0
	$(QUOTE)D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE)  -x c -funsigned-char -funsigned-bitfields -DNDEBUG -DF_CPU=16000000UL  -I"D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\include"  -O0 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -mrelax -g2 -Wall -mmcu=atmega2560 -B "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\gcc\dev\atmega2560" -c -std=gnu99 -save-temps -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<" 
	@echo Finished building: $<
	

./thread.o: .././thread.c
	@echo Building file: $<
	@echo Invoking: AVR/GNU C Compiler : 5.4.0
	$(QUOTE)D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE)  -x c -funsigned-char -funsigned-bitfields -DNDEBUG -DF_CPU=16000000UL  -I"D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\include"  -O0 -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -mrelax -g2 -Wall -mmcu=atmega2560 -B "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\gcc\dev\atmega2560" -c -std=gnu99 -save-temps -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)"   -o "$@" "$<" 
	@echo Finished building: $<
	




# AVR32/GNU Preprocessing Assembler



# AVR32/GNU Assembler
./startup_thread.o: .././startup_thread.S
	@echo Building file: $<
	@echo Invoking: AVR/GNU Assembler : 5.4.0
	$(QUOTE)D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE) -Wa,-gdwarf2 -x assembler-with-cpp -c -mmcu=atmega2560 -B "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\gcc\dev\atmega2560" -I "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\include"  -v -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -mrelax -Wa,-g   -o "$@" "$<" 
	@echo Finished building: $<
	

./switch_threads.o: .././switch_threads.S
	@echo Building file: $<
	@echo Invoking: AVR/GNU Assembler : 5.4.0
	$(QUOTE)D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE) -Wa,-gdwarf2 -x assembler-with-cpp -c -mmcu=atmega2560 -B "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\gcc\dev\atmega2560" -I "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\include"  -v -MD -MP -MF "$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -mrelax -Wa,-g   -o "$@" "$<" 
	@echo Finished building: $<
	





ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: $(OUTPUT_FILE_PATH) $(ADDITIONAL_DEPENDENCIES)

$(OUTPUT_FILE_PATH): $(OBJS) $(USER_OBJS) $(OUTPUT_FILE_DEP) $(LIB_DEP) $(LINKER_SCRIPT_DEP)
	@echo Building target: $@
	@echo Invoking: AVR/GNU Linker : 5.4.0
	$(QUOTE)D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-gcc.exe$(QUOTE) -o$(OUTPUT_FILE_PATH_AS_ARGS) $(OBJS_AS_ARGS) $(USER_OBJS) $(LIBS) -Wl,-Map="2024_avros_ver0.map" -Wl,--start-group -Wl,-lm  -Wl,--end-group -mrelax -mmcu=atmega2560 -B "D:\Program Files\ATSTUDIO\7.0\Packs\atmel\ATmega_DFP\1.7.374\gcc\dev\atmega2560"  
	@echo Finished building target: $@
	"D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-objcopy.exe" -O ihex -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures  "2024_avros_ver0.elf" "2024_avros_ver0.hex"
	"D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-objcopy.exe" -j .eeprom  --set-section-flags=.eeprom=alloc,load --change-section-lma .eeprom=0  --no-change-warnings -O ihex "2024_avros_ver0.elf" "2024_avros_ver0.eep" || exit 0
	"D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-objdump.exe" -h -S "2024_avros_ver0.elf" > "2024_avros_ver0.lss"
	"D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-objcopy.exe" -O srec -R .eeprom -R .fuse -R .lock -R .signature -R .user_signatures "2024_avros_ver0.elf" "2024_avros_ver0.srec"
	"D:\Program Files\ATSTUDIO\7.0\toolchain\avr8\avr8-gnu-toolchain\bin\avr-size.exe" "2024_avros_ver0.elf"
	
	





# Other Targets
clean:
	-$(RM) $(OBJS_AS_ARGS) $(EXECUTABLES)  
	-$(RM) $(C_DEPS_AS_ARGS)   
	rm -rf "2024_avros_ver0.elf" "2024_avros_ver0.a" "2024_avros_ver0.hex" "2024_avros_ver0.lss" "2024_avros_ver0.eep" "2024_avros_ver0.map" "2024_avros_ver0.srec" "2024_avros_ver0.usersignatures"
	