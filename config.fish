if status is-interactive
  # theme
  fish_config theme choose "Rosé Pine Moon Auto"
  
  # hydro
  set --global hydro_symbol_prompt ">"
  set --global hydro_symbol_git_dirty " x"
  
  set --global hydro_multiline true

  ### ALIASES
  # general
  alias :q "exit"
  alias :qa "exit"
  alias cp "rsync -avSAXHP"
  alias dd "dd status=progress"
  alias eza "eza --icons --long --all"
  alias yay "yay --sudoloop"
  alias fixmypdf "ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy"

  # git
  alias gc "git commit -m"
  alias gd "git diff"
  alias gl "git log --pretty=format:'%h - %an : %s'"
  alias gll "git log --pretty=format:'%h' | head -n1"
  alias gp "git pull && git push"
  alias gs "git status"
end
