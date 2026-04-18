function zmkfwu
  # zmkfwu short for ZMK firmware update
  if test ! -d .git
    echo "exiting: not running in a git repository"
    return
  end
  
  switch $argv[1]
  case r
      set side "right"
  case right
      set side "right"
  case l
      set side "left"
  case left
      set side "left"
  case d
      set side "dongle"
  case dongle
      set side "dongle"
  case '*'
      echo "USAGE: zmkfwu <side>"
      echo "side options: dongle|left|right"
      return
  end

  git pull
  set git_hash $(git log --pretty=format:"%h" | head -n1)

  echo "---> waiting for firmware download"
  while test ! -f ~/Downloads/firmware.zip
    sleep 1
  end
  sleep 2 # fixes an issue when the firmware is extracted later
  echo "--- firmware found"
  
  echo "--- moving firmware to $(pwd)"
  mv -v ~/Downloads/firmware.zip ./firmware_$git_hash.zip

  echo "--- unzipping firmware"
  unzip -q firmware_$git_hash.zip -d firmware_$git_hash
  if test ! -d firmware_$git_hash
    echo "ERROR: unzipping firmware_$git_hash.zip. Please retry!"
    return
  end

  sudo echo "---> waiting for controller to show up in flash-mode"
  set device "$(lsblk -o KNAME,MODEL | grep -Po '(sd[a-z0-9]{1,2})(?=\s*\w+\s*UF2)')"
  while test -z $device
    sleep 2
    set device "$(lsblk -o KNAME,MODEL | grep -Po '(sd[a-z0-9]{1,2})(?=\s*\w+\s*UF2)')"
  end
  echo "--- controller found"
  sudo mount /dev/$device /mnt

  echo "--- copying firmware for '$side'"
  sudo cp -v ./firmware_$git_hash/$(ls -1 firmware_$git_hash | grep $side) /mnt/
  
  echo "--- cleanup"
  sudo umount /mnt
  rm -rv ./firmware_$git_hash/

  # echo "--- updating firmware on git"
  git rm firmware_*.zip
  # git add firmware_$git_hash.zip
  # git commit -m "update firmware.zip: updated firmware to $git_hash."
  # git push
  # git status
end
