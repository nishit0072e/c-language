compile: m.s m.ld
	riscv64-unknown-elf-gcc -O0 -ggdb -nostdlib -march=rv32im -mabi=ilp32 -Wl,-Tm.ld m.s -o m.elf
	riscv64-unknown-elf-objcopy -O binary m.elf m.bin

printbinary: m.bin
	xxd -e -c 4 -g 4 m.bin

startqemu: m.elf
	qemu-system-riscv32 -S -M virt -nographic -bios none -kernel m.elf -gdb tcp::1234

connectgdb: m.elf
	gdb-multiarch m.elf -ex "target remote localhost:1234" -ex "break _start" -ex "continue" -q

clean:
	rm -rf *.out *.bin *.elf