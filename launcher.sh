#!/bin/sh
# launcher for the pygame examples that are in Raspberry Pi Wheezy Raspbian
# Author: KenT

RET=0
SOUND=$(zenity --list --width=350 --height=250 --radiolist \
  --title="Choose the Audio Output" \
  --column "Select" --column="Output" TRUE "Leave as is" FALSE "Auto" FALSE "Force Headphones" FALSE "Force HDMI"  )
RET=$?
echo $SOUND
if [ "$SOUND" = "Leave as is" ]; then
   echo "Leave as is"
elif [ "$SOUND" = "Auto" ]; then
   amixer cset numid=3 0
   echo "Auto set"
elif [ "$SOUND" = "Force Headphones" ]; then
   amixer cset numid=3 1
   echo "Headphones set"
elif [ "$SOUND" = "Force HDMI" ]; then
   amixer cset numid=3 2
   echo "HDMI set"
else
   echo "cancel"
fi

while [ $RET -eq 0 ]; do
  GAME=$(zenity --width=450 --height=700 --list \
    --title="Choose the Pygame example to launch" \
    --text="Website www.pygame.org/docs/ref/examples.html" \
    --column="Example name" --column="Description" \
    readme "Read Me First" \
    aliens "Full Aliens" \
    oldalien "Original Aliens" \
    stars "Starfield example" \
    chimp "Hit the moving chimp" \
    moveit "Display animated objects" \
    fonty "** Font rendering example" \
    eventlist "Display Pygame Events" \
    arraydemo "** Various surfarray effects" \
    sound "** Load and Play a Sound" \
    sound_array_demos "** various sndarray effects" \
    liquid "animated liquid effect" \
    testsprite "** sprites moving around" \
    cursors "display custom cursors" \
    pixelarray "pixelarray generated effects" \
    scroll "Surface.scroll example" \
    website "www.pygame.org/docs/ref/examples.html")
  RET=$?
  echo $RET
  if [ "$RET" -eq 0 ]
  then
     if [ "$GAME" = "website" ]
     then
        sensible-browser "www.pygame.org/docs/ref/examples.html"
     elif [ "$GAME" = "readme" ]
     then
        leafpad "/home/pi/pygame_examples/readme.txt"
     else
       if [ "$GAME" != "" ]; then
          python -m pygame.examples.$GAME
       fi
     fi
  fi
done
