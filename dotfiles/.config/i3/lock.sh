# before locking, set keyboard to us
setxkbmap us;  

# determine current resolution
SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | sed -r 's#.*\ ([0-9]+x[0-9]+).*#\1#')";

# scale wallpaper using ImageMagick and pipe it into i3lock
convert ~/.wallpaper.png -gravity Center -scale "$SCREEN_RESOLUTION" RGB:- \
    | i3lock --raw "$SCREEN_RESOLUTION":rgb -i /dev/stdin;

# on unlock, return kb layouts to normal
$HOME/.config/i3/keyboard.sh;
