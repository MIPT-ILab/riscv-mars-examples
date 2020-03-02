# Building RISC-V MARS examples
# This makefile builds all RISCV examples with .s extension in the directory
# Author Eric Konks
# Copyright 2020 MIPT-V

RISCV_AS?=riscv64-unknown-elf-as
AS_FLAGS?=-march=rv32i -mabi=ilp32
RISCV_LD?=riscv64-unknown-elf-ld
LD_FLAGS?=-melf32lriscv --no-relax

OBJ_DIR:=obj
BIN_DIR:=bin

# Get all files with .s extension and replace it with .out
EXAMPLES?=$(patsubst %.s,$(BIN_DIR)/%.out,$(wildcard *.s))

all: start $(EXAMPLES)
	@echo Done

start:
	@echo Start building
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(BIN_DIR)

$(OBJ_DIR)/%.o: %.s
	@$(RISCV_AS) $(AS_FLAGS) $< -o $@

$(BIN_DIR)/%.out: $(OBJ_DIR)/%.o
	@$(RISCV_LD) $(LD_FLAGS) $< -o $@
	@echo '-> $@ is built'

.PHONY: clean
clean:
	@rm -rf $(OBJ_DIR)