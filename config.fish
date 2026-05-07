if status is-interactive
    # theme
    fish_config theme choose --color-theme=dark "Rosé Pine Moon Auto"

    # hydro
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
    set --global hydro_color_pwd "#f6c177"
    set --global hydro_color_git "#c4a7e7"
    set --global hydro_color_start "#9ccfd8"
    set --global hydro_color_error "#eb6f92"
    set --global hydro_color_prompt "#908caa"
    set --global hydro_color_duration "#3e8fb0"

    set --global hydro_symbol_prompt "|>"
    set --global hydro_symbol_start " "
    set --global hydro_multiline false
    set --global fish_prompt_pwd_dir_length 3

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
end
