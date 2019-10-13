#!/bin/bash

xrdb -merge ~/.Xresources &
xmodmap ~/.Xmodmap &
#exec twm
exec fvwm
#exec spectrwm
#exec i3
