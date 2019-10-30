#!/bin/bash

xrdb -merge ~/.Xresources &
xmodmap ~/.Xmodmap &
#exec vtwm
#exec fvwm
#exec spectrwm
#exec i3
exec wmaker
