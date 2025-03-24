function syu
  echo "update via pacman"
  sudo pacman --noconfirm --needed -Syyu

  echo "\nupdate via yay"
  yay --noconfirm --needed -Syu

  echo "\nupdate via flatpak"
  sudo flatpak update --system --assumeyes --noninteractive

  echo "\nremoving unneeded packages via pacman"
  sudo pacman --noconfirm -Rs "$(pacman -Qdtq)"

  echo "\ncleaning downloaded packages via pacman"
  sudo pacman --noconfirm -Sc "$(pacman -Qdtq)"
end
