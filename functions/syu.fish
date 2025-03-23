function syu
  sudo pacman --noconfirm --needed -Syyu
  yay --noconfirm --needed -Syu
  sudo pacman --noconfirm -Rs "$(pacman -Qdtq)"
  sudo pacman --noconfirm -Sc "$(pacman -Qdtq)"
end
