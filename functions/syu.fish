function syu
  set current_path "$(pwd)"
  set local_config "~/.config/fish"

  # running PandaUpdater
  bash -c "$local_config/scripts/PandaUpdater/PandaUpdater.sh"

  if command -v "nvim" > /dev/null && test -f "/usr/share/nvim/runtime/colors/default.vim" > /dev/null
    echo "--- removing standard nvim themes"
    sudo rm -rv /usr/share/nvim/runtime/colors/*.vim
  end

  echo "--- updating os-setup private repository"
  cd /home/os-setup/ && sudo git pull
  cd "$current_path"
end
