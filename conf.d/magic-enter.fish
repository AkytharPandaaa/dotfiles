function magic-enter-cmd --description "Print the command to run when no command was given"
    set --local my_magic_command 'eza --icons --all'
    
    # git dir magic command
    if command git rev-parse --is-inside-work-tree &>/dev/null
        set my_magic_command "git pull; gs; echo \"===========\"; eza --long --all"
    end
    
    # look for something else, like an .env directory
    # or whatever other magic commands you need
    # ...
    
    # be sure not to actually run the command
    # just print it out
    echo $my_magic_command
end

function magic-enter
    set -l cmd (commandline)
    if test -z "$cmd"
        commandline -r (magic-enter-cmd)
        commandline -f suppress-autosuggestion
    end
    commandline -f execute
end

function magic-enter-bindings --description "Bind magic-enter for default and vi key bindings"
    bind \r magic-enter
    if functions -q fish_vi_key_bindings
        bind -M insert \r magic-enter
        bind -M default \r magic-enter
    end
end
magic-enter-bindings
