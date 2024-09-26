# sl as a coreboot payload

Fork of the [sl](https://github.com/mtoyoda/sl) command to run as a coreboot payload.

## Usage

Compile [coreboot](https://doc.coreboot.org/tutorial/part1.html) and select `sl.elf` as the payload.

Test with qemu: `qemu-system-i386 -bios build/coreboot.rom`.
