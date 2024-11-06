# before locking, set keyboard to us
setxkbmap us;  

brightnessctl set 10;

# determine current resolution
SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | sed -r 's#.*\ ([0-9]+x[0-9]+).*#\1#')";

# scale wallpaper using ImageMagick and pipe it into i3lock
convert ~/.wallpaper.png -gravity Center -scale "$SCREEN_RESOLUTION" RGB:- \
    | i3lock --nofork --raw "$SCREEN_RESOLUTION":rgb -i /dev/stdin;

# on unlock, return kb layouts to normal
brightnessctl set 100;
$HOME/.config/i3/keyboard.sh;
