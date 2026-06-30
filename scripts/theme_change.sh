#!/bin/bash
PROFILE=$(powerprofilesctl get)

if [ "$PROFILE" = "balanced" ]; then
  sed -E -i "11s/solid/transparent/" ~/.config/niri/config.kdl
  sed -E -i "31s/solid/transparent/" ~/.config/kitty/kitty.conf
else
  sed -E -i "11s/transparent/solid/" ~/.config/niri/config.kdl
  sed -E -i "31s/transparent/solid/" ~/.config/kitty/kitty.conf
fi
