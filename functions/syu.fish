function syu
  echo "update via pacman"
  sudo pacman --noconfirm --needed -Syyu
  echo ""

  echo "update via yay"
  yay --noconfirm --needed -Syu
  echo ""

  echo "update via flatpak"
  sudo flatpak update --system --assumeyes --noninteractive
  echo ""

  echo "removing unneeded packages via pacman"
  sudo pacman --noconfirm -Rs "$(pacman -Qdtq)"
  echo ""

  echo "cleaning downloaded packages via pacman"
  sudo pacman --noconfirm -Sc "$(pacman -Qdtq)"

  echo "updating os-setup repo"
  set workdir "$(pwd)"
  cd /home/os-setup/ && sudo git pull
  cd "$workdir"
end
