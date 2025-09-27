function syu
  set current_path "$(pwd)"

  if command -v "pacman"
    echo "--- update via pacman"
    sudo pacman --noconfirm --needed -Syyu
    echo ""
    
    set unneeded_packages "$(sudo pacman -Qdtq)"
    if not test -z "$unneeded_packages"
      echo "--- removing unneeded packages via pacman"
      sudo pacman -Qdtq | sudo pacman --noconfirm -Rsu - 
      echo ""
    
      echo "--- cleaning downloaded packages via pacman"
      sudo pacman -Qdtq | sudo pacman --noconfirm -Sc -
      echo ""
    else
      echo "--- no unneeded packages"
      echo ""
    end
  end

  if command -v "yay"
    echo "--- update via yay"
    yay --sudoloop --noconfirm --needed -Syua --cleanafter
    echo ""

    echo "--- removing unneeded packages via yay"
    yay --sudoloop --noconfirm -Ycc
    echo ""
  end

  if command -v "apt"
    echo "--- update via APT"
    sudo apt update
    sudo apt upgrade -y
    sudo apt autoremove -y
    sudo apt autoclean
  end

  if command -v "apk"
    echo "--- update via apk"
    apk update
    apk upgrade --no-self-upgrade --available --simulate
    apk upgrade --available
  end

  if command -v "flatpak"
    echo "--- update via flatpak"
    sudo flatpak update --system --assumeyes --noninteractive
    echo ""
  end

  if command -v "nvim"
    echo "--- removing standard nvim themes"
    sudo rm -rv /usr/share/nvim/runtime/colors/*.vim
  end

  echo "--- updating os-setup private repository"
  cd /home/os-setup/ && sudo git pull
  cd "$current_path"
end
