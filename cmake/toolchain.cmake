


set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR riscv)

set(CMAKE_C_COMPILER riscv64-unknown-elf-gcc)
set(CMAKE_ASM_FLAGS "-march=rv64gc -mabi=lp64d")

set(CLANG riscv-clang)
set(CLANG_FLAGS -emit-llvm -S --target=riscv64 -march=rv64gc -mabi=lp64d)

set(LLC riscv-llc)
set(LLC_FLAGS -march=riscv64 -mattr=+m,+a,+c,+d)
