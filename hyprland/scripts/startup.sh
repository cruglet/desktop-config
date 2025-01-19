#!/bin/bash

wallpaper_dir="$HOME/.wallpapers"
config_file="$HOME/.config/hypr/hyprpaper.conf"

if [ ! -d "$wallpaper_dir" ]; then
    echo "Directory $wallpaper_dir does not exist."
    exit 1
fi

random_wallpaper=$(find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.bmp" -o -iname "*.gif" \) | shuf -n 1)

if [ -z "$random_wallpaper" ]; then
    echo "No image files found in $wallpaper_dir."
    exit 1
fi

monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

{
    echo "# Hyprpaper configuration"
    echo "ipc = on"
    echo "preload = $random_wallpaper"
    for monitor in $monitors; do
        echo "wallpaper = $monitor, $random_wallpaper"
    done
} > "$config_file"

set_kde_dark() {
    echo "Setting KDE to Breeze Dark..."
    kwriteconfig5 --file kwinrc 'Window Decoration' 'Breeze_Dark'
    kwriteconfig5 --file plasmarc 'Theme' 'Breeze_Dark'
    kwriteconfig5 --file plasmarc 'Color' 'Breeze_Dark'
    kwriteconfig5 --file kwinrc 'ColorScheme' 'Breeze_Dark'
    kwriteconfig5 --file kwinrc 'Theme' 'Breeze_Dark'
    echo "KDE is set to Breeze Dark."
}

set_gnome_dark() {
    echo "Setting GNOME to Dark..."
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    gsettings set org.gnome.desktop.wm.preferences theme "Adwaita-dark"
    gsettings set org.gnome.desktop.interface icon-theme "Adwaita"
    gsettings set org.gnome.desktop.interface cursor-theme "Adwaita"
    echo "GNOME is set to Dark."
}

set_xfce_dark() {
    echo "Setting XFCE to Dark..."
    xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird-dark"
    xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
    xfconf-query -c xsettings -p /Net/CursorThemeName -s "Adwaita"
    echo "XFCE is set to Dark."
}

set_lxqt_dark() {
    echo "Setting LXQt to Dark..."
    lxqt-config-appearance --theme "Breeze-dark"
    lxqt-config-appearance --icon-theme "Adwaita"
    echo "LXQt is set to Dark."
}

set_cinnamon_dark() {
    echo "Setting Cinnamon to Dark..."
    gsettings set org.cinnamon.desktop.interface gtk-theme "Adwaita-dark"
    gsettings set org.cinnamon.desktop.wm.preferences theme "Adwaita-dark"
    gsettings set org.cinnamon.desktop.interface icon-theme "Adwaita"
    gsettings set org.cinnamon.desktop.interface cursor-theme "Adwaita"
    echo "Cinnamon is set to Dark."
}

if [ "$XDG_CURRENT_DESKTOP" == "KDE" ]; then
    set_kde_dark
elif [ "$XDG_CURRENT_DESKTOP" == "GNOME" ]; then
    set_gnome_dark
elif [ "$XDG_CURRENT_DESKTOP" == "XFCE" ]; then
    set_xfce_dark
elif [ "$XDG_CURRENT_DESKTOP" == "LXQt" ]; then
    set_lxqt_dark
elif [ "$XDG_CURRENT_DESKTOP" == "Cinnamon" ]; then
    set_cinnamon_dark
else
    echo "Unknown desktop environment. Unable to apply dark mode."
fi

# restart hyprpaper to apply the new configuration
pkill hyprpaper
hyprpaper &>/dev/null &
