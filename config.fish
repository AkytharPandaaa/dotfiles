if status is-interactive
    # theme
    fish_config theme choose --color-theme=dark "Rosé Pine Moon Auto"

    # theme setup: ln -s ~/.config/fish/plugins/starship-rose-pine/rose-pine-moon.toml ~/.config/starship.toml

    #set --global hydro_color_pwd "#$(echo $fish_color_gold | grep -Po [0-9af]{6})"
    # Rosé Pine colors
    # fish_color_subtle #908caa
    # fish_color_text #e0def4
    # fish_color_love #eb6f92
    # fish_color_gold #f6c177
    # fish_color_rose #ea9a97
    # fish_color_pine #3e8fb0
    # fish_color_foam #9ccfd8
    # fish_color_iris #c4a7e7

    # sponge
    set sponge_successful_exit_codes 0 127 255
    set sponge_purge_only_on_exit true

    ### ALIASES
    # general
    alias :qa exit
    alias dd "dd status=progress"
    alias dskspeed "sudo echo \"running write test:\" && sudo dd bs=100M count=50 oflag=dsync if=/dev/zero"
    alias eza "eza --icons"
    alias fixmypdf "ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy"
    alias rm "rm -v"
    alias rsync "rsync -avSAXHP"
    alias yay "yay --sudoloop"

    # git
    alias gc "git commit -m"
    alias gd "git diff"
    alias gl "git log --pretty=format:'%h - %an : %s'"
    alias gll "git log --pretty=format:'%h' | head -n1"
    alias gp "git pull && git push"
    alias gs "git status -sb"
    alias gsubinit "git submodule update --init --recursive"

    # starship
    starship init fish | source
end
