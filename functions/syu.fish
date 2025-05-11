function syu
  set current_path "$(pwd)"

  echo "update via pacman"
  sudo pacman --noconfirm --needed -Syyu
  echo ""

  echo "update via yay"
  yay --sudoloop --noconfirm --needed -Syua --cleanafter
  echo ""

  echo "update via flatpak"
  sudo flatpak update --system --assumeyes --noninteractive
  echo ""

  echo "removing unneeded packages via pacman"
  sudo pacman -Qdtq | sudo pacman --noconfirm -Rsu - 
  echo ""

  echo "removing unneeded packages via yay"
  yay --sudoloop --noconfirm -Ycc
  echo ""

  echo "cleaning downloaded packages via pacman"
  sudo pacman -Qdtq | sudo pacman --noconfirm -Sc -
  echo ""

  echo "updating os-setup private repository"
  cd /home/os-setup/ && sudo git pull
  cd "$current_path"
end
