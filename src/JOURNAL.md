# SuperBRICKOUT JOURNAL

## January 11th, 2021

Working through commenting the code. Trying to understand how the scores are written to the screen. 

I have determined that I split the score into 5 digits and stored the value for each of those digits separate from the score value.

Good progress on figuring out how the score and high score are handled. When the program returns to the title screen the score is updated and the high score is also updated if necessary. Saddly no "NEW HIGH SCORE" is displayed to the user. We can add this to our list of enhacments.

## January 13th, 2021

Now have most of the game startup figured out. Score display is clever if bricks are only ever worth 1 point. If we decide to have different values for bricks in the future we will need to do something else. There is a lot of repeated code used for drawing graphics to the screen. Maybe I will refactor that into a routine in the future.

### Level Display

Next up is the level drawing routine that displays the bricks. As far as I can tell the data structure for each level is 1 byte that is the number of breakable bricks in the level and then 7 rows of 15 bricks per row and there are 25 levels. I extracted the levels from the original version of BRICKOUT.BIN using `hexdump` to create `LVLDAT.ASM` . The value of each brick is used as an index into the sprites for the bricks when displaying them to the screen. 

