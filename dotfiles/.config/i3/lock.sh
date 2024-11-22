# before locking, set keyboard to us
setxkbmap us;  

# save the current brightness, lower it to 10 to save power when locked
CURR_BRIGHTNESS=$(brightnessctl g)
brightnessctl set 10;

# determine current resolution
SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | sed -r 's#.*\ ([0-9]+x[0-9]+).*#\1#')";

# scale wallpaper using ImageMagick and pipe it into i3lock
magick ~/.wallpaper.png -gravity Center -resize $SCREEN_RESOLUTION^ RGB:- \
    | i3lock --nofork --raw $SCREEN_RESOLUTION:rgb -i /dev/stdin;

# on unlock, restore brightness and return kb layouts to normal
brightnessctl set $CURR_BRIGHTNESS;
$HOME/.config/i3/keyboard.sh;
