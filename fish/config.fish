###
# FISH OVERRIDES
###
function fish_greeting
	clear
	neofetch
end

function fish_prompt
    set cwd (pwd)
    set home_icon "󰋜"
    
    # Color definitions
    set bracket_color (set_color cyan)
    set dir_color (set_color cyan)
    
    if test $cwd = "/"
        echo -n $bracket_color"["$dir_color"/"$bracket_color"] "(set_color normal)
        return
    end
    
    if test $cwd = (realpath ~)
        echo -n $bracket_color"["$dir_color$home_icon$bracket_color"] "(set_color normal)
        return
    end
    
    set base (basename $cwd)
    echo -n $bracket_color"["$dir_color$base$bracket_color"] "(set_color normal)
end


###
# MISC
### 

function re
	 cd ~
    clear
    exec fish
end

function clear
	 printf '\033[2J\033[3J\033[1;1H'
end

function refreshbg
	~/.config/hypr/startup.sh
end

function uefi
	systemctl reboot --firmware-setup
end

###
# CONFIGS
###
function fishconf
	nvim ~/.config/fish/config.fish
end

function hyprconf
	cd ~/.config/hypr
	nvim
end

function kittyconf
	nvim ~/.config/kitty/kitty.conf
end

function nvconf
	cd ~/.config/nvim/lua && nvim
end



function install_font
    if test (count $argv) -eq 0
        echo "Usage: install_font <font-file1> [font-file2 ...]"
        return 1
    end

    set font_dir "/usr/share/fonts/custom"

    if not test -d $font_dir
        echo "Creating font directory: $font_dir"
        sudo mkdir -p $font_dir
    end

    for font in $argv
        if test -f $font
            echo "Installing $font to $font_dir"
            sudo cp $font $font_dir/
        else
            echo "File not found: $font"
            return 1
        end
    end

    echo "Setting permissions for $font_dir"
    sudo chmod 644 $font_dir/*
    sudo chown root:root $font_dir/*

    echo "Updating font cache..."
    sudo fc-cache -fv

    echo "Font installation complete!"
end
