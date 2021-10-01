# Makefile for building jstest-sdl

CPUFLAGS += -DNO_ASM -DDONT_WANT_ARM_OPTIMIZATIONS -DARM_FIX -DCLASSIC -DARM64
LDFLAGS += -static-libgcc #-static-libstdc++
fpic = -fPIC

CFLAGS  = -std=c99
CXXFLAGS += `sdl2-config --cflags`
LIBS	= -lncurses -ltinfo `sdl2-config --libs`


all:
	$(CC) $(CXXFLAGS) jstest-sdl.c -o jstest-sdl $(CFLAGS) $(LIBS)

clean:
	-rm -f jstest-sdl

install:
	sudo cp jstest-sdl /usr/bin/
