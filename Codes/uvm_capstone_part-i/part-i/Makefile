# Seed for RTL simulation
SEED            := $(shell date +%y%m%d%H)


# Output directories
OUT             := out
OUT_SEED        := $(OUT)/seed-$(SEED)
OUT_DIR         := $(dir $(OUT)/)
OUT_SEED_LIB    := $(OUT_SEED)/INCA_libs
OUT_SEED_TEST   := $(OUT_SEED)/test

# Toolchain paths
RISCV_TOOLCHAIN := /home/ahmed/RISCV64/riscv64-unknown-elf-toolchain/riscv
RISCV_GCC       := $(RISCV_TOOLCHAIN)/bin/riscv64-unknown-elf-gcc
RISCV_OBJCOPY   := $(RISCV_TOOLCHAIN)/bin/riscv64-unknown-elf-objcopy
RISCV_OBJDUMP   := $(RISCV_TOOLCHAIN)/bin/riscv64-unknown-elf-objdump

# Assembly test and binary
ASM_TEST        ?= init_regs
BINARY          := $(OUT_SEED_TEST)/$(ASM_TEST).bin

# RISC-V compilation settings
ISA             := rv32imczicsr
MABI            := ilp32
BOOT_ADDR       := 0x80000000

# Directories
RTL             := rtl
VERIF           := verif
TESTS           := tests

RTL_TOP         := rtl/ibex_top_tracing.sv
TB_TOP          := verif/tb_top.sv

PACKAGE00       := verif/bus_params_pkg.sv
PACKAGE0        := verif/mem_model_pkg.sv
PACKAGE1        := verif/inst_uvc/inst_pkg.sv
PACKAGE2        := verif/data_uvc/data_pkg.sv

VCS             := $(shell command -v vcs)

# Generated directories
gen-dirs        := $(OUT_DIR) $(OUT_SEED) $(OUT_SEED_LIB) $(OUT_SEED_TEST)

# Include directories
INCDIRS         := +incdir+$(RTL) +incdir+$(VERIF) +incdir+$(TESTS)

# Rules
all:

$(gen-dirs): %:
	mkdir -p $@

# Compile assembly test to binary
$(BINARY): $(TESTS)/$(ASM_TEST).S | $(gen-dirs)
	$(RISCV_GCC) -march=$(ISA) -mabi=$(MABI) -nostdlib -nostartfiles $< -o $(OUT_SEED_TEST)/$(ASM_TEST).elf
	$(RISCV_OBJDUMP) -d $(OUT_SEED_TEST)/$(ASM_TEST).elf > $(OUT_SEED_TEST)/$(ASM_TEST).ass
	$(RISCV_OBJCOPY) -O binary $(OUT_SEED_TEST)/$(ASM_TEST).elf $@

# Build binary locally
bin:
	@if [ "$(filter-out bin,$(MAKECMDGOALS))" = "" ]; then \
		echo "Error: Provide the path of the .S file as an argument."; \
		echo "Usage: make bin <path_of_S_file>"; \
		exit 1; \
	fi
	@src=$(filter-out bin,$(MAKECMDGOALS)); \
	basename=$$(basename $$src .S); \
	$(RISCV_GCC) -march=$(ISA) -mabi=$(MABI) -nostdlib -nostartfiles $$src -o $(TESTS)/$$basename.elf; \
	$(RISCV_OBJDUMP) -d $(TESTS)/$$basename.elf > $(TESTS)/$$basename.ass; \
	$(RISCV_OBJCOPY) -O binary $(TESTS)/$$basename.elf $(TESTS)/$$basename.bin; \
	echo "Binary created: $(TESTS)/$$basename.bin"

# Testbench and RTL compilation only
test-compile: $(gen-dirs)
	vcs -full64 -debug_access+all -sverilog $(RTL) $(VERIF) $(TESTS) $(INCDIRS) -ntb_opts uvm-1.2 \
	    $(PACKAGE00) $(PACKAGE0) $(PACKAGE1) $(PACKAGE2) $(RTL_TOP) $(TB_TOP) \
	    -cm line+cond+tgl+branch+assert -cm_dir $(OUT_SEED)/simv.vdb -l $(OUT_SEED)/vcs.log
	mv simv* $(OUT_SEED)


# Run simulation with binary file
sim: $(OUT_SEED)/simv
	@if [ "$(ASM_TEST)" = "" ]; then \
		echo "Error: Provide the binary file as ASM_TEST=tests/<binary_file>"; \
		exit 1; \
	fi; \
	if [ ! -f "$(ASM_TEST)" ]; then \
		echo "Error: Binary file $(ASM_TEST) not found. Ensure it exists."; \
		exit 1; \
	fi; \
	$(OUT_SEED)/simv +bin=$(ASM_TEST) +UVM_TIMEOUT=800000,NO \
		-cm line+cond+tgl+branch+assert -cm_dir $(OUT_SEED)/simv.vdb -l $(OUT_SEED)/simv.log


detailed-cov: sim
	urg -dir $(OUT_SEED)/simv.vdb -format text -group show_bin_values

cov-gui:
	dve -covdir $(OUT_SEED)/simv.vdb/ -full64




.PHONY: clean

clean:
	rm -rf $(OUT_DIR)

# Ensure Make doesn't interpret arguments as targets
%:
	@:
