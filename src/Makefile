
MAMEFLAGS ?= -window -nomax  -resolution0 1200x900

LWASM = lwasm
LWASMFLAGS = -9 -b -d --list --symbols --format=decb


BRICKOUT.DSK: BRICKOUT.BIN
	- rm $@
	decb dskini $@
	decb copy -2 -b -r $^ $@,$^

BRICKOUT.BIN: *.ASM
	$(LWASM) BRICK.ASM $(LWASMFLAGS) --output=$@

debug: BRICKOUT.DSK
	mame coco3 -skip_gameinfo $(MAMEFLAGS) \
		-debug \
		-flop1 $^ \
		-autoboot_delay 1 -autoboot_command "\nLOADM\"BRICKOUT.BIN\":EXEC\n"

run: BRICKOUT.DSK
	mame coco3 -skip_gameinfo $(MAMEFLAGS) \
		-flop1 $^ \
		-autoboot_delay 1 -autoboot_command "\nLOADM\"BRICKOUT.BIN\":EXEC\n"

clean:
	rm BRICKOUT.BIN
	rm BRICKOUT.DSK
