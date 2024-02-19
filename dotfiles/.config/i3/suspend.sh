setxkbmap us &&                                # before locking, set keyboard to us
i3lock -n -i ~/.config/i3/wall.png --tiling |  # lock the screen and...
systemctl suspend ;                            # immediately suspend
$HOME/.config/i3/keyboard.sh                   # on unlock, return kb layouts to normal
