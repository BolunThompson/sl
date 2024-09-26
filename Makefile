# copied from sample libpayload Makefile.
include ../../.config
include ../../build/xcompile

ARCH-$(CONFIG_LP_ARCH_X86)   := x86_32

CC := $(CC_$(ARCH-y))
AS := $(AS_$(ARCH-y))
LIBPAYLOAD_DIR := ../../install/libpayload
XCC := CC="$(CC)" $(LIBPAYLOAD_DIR)/bin/lpgcc
XAS := AS="$(AS)" $(LIBPAYLOAD_DIR)/bin/lpas
CFLAGS := -fno-builtin -Wall -Werror -Os \
		  -I$(LIBPAYLOAD_DIR)/include/ \
		  -I$(LIBPAYLOAD_DIR)/include/x86 \
		  -L$(LIBPAYLOAD_DIR)/lib/ \
		  -lc
		  
TARGET := sl
OBJS := $(TARGET).o

all: $(TARGET).elf

$(TARGET).elf: $(OBJS)
	$(XCC) $(CFLAGS) -o $@ $(OBJS)

%.o: %.c
	$(XCC) $(CFLAGS) -c -o $@ $<

%.S.o: %.S
	$(XAS) --32 -o $@ $<

clean:
	rm -f $(TARGET).elf *.o

distclean: clean
