if status is-interactive
    # Commands to run in interactive sessions can go here
    set FLINE_PATH $HOME/.config/fish/plugins/fishline

    # fishline
    source $FLINE_PATH/init.fish

    # Aliases
  alias :q "exit"
  alias cp "rsync -avSAXHP"
  alias eza "eza --icons"
  alias fixmypdf "ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy"

  # git Aliases
  alias gc "git commit -m"
  alias gd "git diff"
  alias gl "git log --pretty=format:'%h - %an : %s'"
  alias gp "git pull && git push"
  alias gs "git status"

end
