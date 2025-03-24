function syu
  sudo pacman --noconfirm --needed -Syyu
  yay --noconfirm --needed -Syu
  sudo flatpak --system --assumeyes --noninteractive
  sudo pacman --noconfirm -Rs "$(pacman -Qdtq)"
  sudo pacman --noconfirm -Sc "$(pacman -Qdtq)"
end
