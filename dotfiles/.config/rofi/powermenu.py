#!/usr/bin/env python3

import os
import subprocess

INITIAL_CALL = '0'
SELECTED_ENTRY = '1'
SELECTED_CUSTOM_ENTRY = '2'

if __name__ == '__main__':

    if os.environ.get('ROFI_RETV', INITIAL_CALL) == INITIAL_CALL:
        print("Shutdown\0icon\x1fsystem-shutdown\x1finfo\x1fpoweroff")
        print("Reboot\0icon\x1fsystem-reboot\x1finfo\x1freboot")
        print("Suspend\0icon\x1fsystem-log-out\x1finfo\x1fsuspend")
        print("Lock\0icon\x1fsystem-lock-screen\x1finfo\x1flock")
        print("Logout\0icon\x1fdialog-password\x1finfo\x1flogout")
        exit()

    info = os.environ.get('ROFI_INFO', 'none')
    match info:
        case 'lock':
            subprocess.Popen(['loginctl', 'lock-session'])
        case 'poweroff':
            subprocess.Popen(['systemctl', 'poweroff'])
        case 'reboot':
            subprocess.Popen(['systemctl', 'reboot'])
        case 'suspend':
            subprocess.Popen(['systemctl', 'suspend'])
        case 'logout':
            subprocess.Popen(['i3-msg', 'exit'])
        case _:
            pass
