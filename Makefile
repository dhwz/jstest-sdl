# Makefile for building jstest-sdl

CPUFLAGS += -DNO_ASM -DDONT_WANT_ARM_OPTIMIZATIONS -DARM_FIX -DCLASSIC -DARM64
LDFLAGS += -static-libgcc #-static-libstdc++
fpic = -fPIC

CFLAGS  = -std=c99
#CFLAGS+=" -I$(get_build_dir SDL2-14)/include"
CXXFLAGS += `$SYSROOT_PREFIX/usr/bin/sdl2-config --cflags`
LIBS	= -lncurses -ltinfo `$SYSROOT_PREFIX/usr/bin/sdl2-config --libs`


all:
	$(CC) $(CXXFLAGS) jstest-sdl.c -o jstest-sdl $(CFLAGS) $(LIBS)

clean:
	-rm -f jstest-sdl

install:
	sudo cp jstest-sdl /usr/bin/
