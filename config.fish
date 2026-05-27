if status is-interactive

    # ===============================
    # THEME
    # ===============================
    fish_config theme choose --color-theme=dark "Rosé Pine Moon Auto"

    # starship theme
    if command -q starship && test -e ~/.config/fish/plugins/rose-pine-starship/rose-pine-moon.toml && ! test -e ~/.config/starship.toml
        ln -s ~/.config/fish/plugins/rose-pine-starship/rose-pine-moon.toml ~/.config/starship.toml
    end

    # ===============================
    # PLUGINS
    # ===============================

    # install PandaFishFun (custom functions)
    if test -e "./scripts/PandaFishFun/functions/_panfishfun_universal_os_update.fish"
        fisher install ./scripts/PandaFishFun/
    end

    # magic-enter
    function magic-enter-cmd --description "Print the command to run when no command was given"
        set -l cmd ls
        if command git rev-parse --is-inside-work-tree &>/dev/null
            set cmd "git pull; git status -sb; echo ''; ls"
        end
        echo $cmd
    end

    # sponge
    set sponge_successful_exit_codes 0 127 255
    set sponge_purge_only_on_exit true

    # ===============================
    # ALIASES
    # ===============================

    # general
    alias :qa exit
    alias cpufreq "watch -n1 \"grep '^[c]pu MHz' /proc/cpuinfo | column\""
    alias dd "dd status=progress"
    alias dskspeed "sudo echo 'running write test:' && sudo dd bs=100M count=50 oflag=dsync if=/dev/zero"
    alias eza "eza --icons --oneline"
    alias fixmypdf "ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy"
    alias ls "ls -1"
    alias rm "rm -v"
    alias rsync "rsync -avSAXHP"
    alias yay "yay --sudoloop"

    if command -q eza
        alias ls eza
    end

    # git
    alias gc "git commit -m"
    alias gd "git diff"
    alias gl "git log --pretty=format:'%h - %an : %s'"
    alias gp "git pull && git push"
    alias gs "git status -sb"
    alias gsubinit "git submodule update --init --recursive"

    # starship
    starship init fish | source
end
