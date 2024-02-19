#!/bin/sh

case "$1" in
    --popup)
        yad=$(yad --width 300 --entry --undecorated --title "System Logout" --image=gnome-shutdown --text "Choose action:" --entry-text "Shutdown" "Reboot" "Logout" "Suspend")

        case "$yad" in
            Shutdown)
                systemctl poweroff
                ;;
            Reboot)
                systemctl reboot
                ;;
            Suspend)
                $HOME/.config/i3/suspend.sh
                ;;
            Logout)
                i3-msg exit
                ;;
        esac
        ;;
    *)
        echo "LN" # ⏻
        ;;
esac
