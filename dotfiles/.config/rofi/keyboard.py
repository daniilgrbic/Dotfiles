#!/usr/bin/env python3

import os
from subprocess import call
from dataclasses import dataclass
from typing import Dict

INITIAL_CALL = '0'
SELECTED_ENTRY = '1'
SELECTED_CUSTOM_ENTRY = '2'

@dataclass
class Layout:
    name: str
    id: str
    variant: str = ''
    meta: str = ''

layouts: Dict[str, Layout] = {
    'us'     : Layout('USA', 'us', meta='angl,engl,англ,енгл'),
    'rs-lat' : Layout('LAT', 'rs', variant='latinyz', meta='srp,rs,српрс'),
    'rs-cyr' : Layout('CYR', 'rs', variant='yz', meta='srp,rs,српрс'),
    'de-qty' : Layout('DEU', 'de', variant='qwerty', meta='german,немецкий,герм,деу'),
    'ru-pho' : Layout('RUS', 'ru', variant='phonetic', meta='руски')
}

if __name__ == '__main__':

    if os.environ.get('ROFI_RETV', INITIAL_CALL) == INITIAL_CALL:
        for key, layout in layouts.items():
            entry = f'{layout.name+" Layout"}\0icon\x1finput-keyboard'
            entry += f'\x1finfo\x1f{key}'
            entry += f'\x1fmeta\x1fxkb,lang,kl,ланг,кл,таст,{layout.meta}'
            print(entry)
        exit()

    info = os.environ.get('ROFI_INFO', 'none')
    layout = layouts[info]

    if layout.id != 'us':
        call(['setxkbmap', f'us,{layout.id}', '-variant', f',{layout.variant}', '-option', 'grp:alt_shift_toggle'])
        call(['xte', 'keydown Shift_L', 'keydown Alt_L', 'keyup Alt_L', 'keyup Shift_L'])
    else:
        call(['setxkbmap', 'us'])
