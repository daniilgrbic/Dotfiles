#!/bin/sh

./setup-flatpak.sh

flatpak install -y org.gtk.Gtk3theme.Adwaita-dark

sudo flatpak override --filesystem=$HOME/.themes
sudo flatpak override --filesystem=$HOME/.icons
sudo flatpak override --env=GTK_THEME=Adwaita-dark
