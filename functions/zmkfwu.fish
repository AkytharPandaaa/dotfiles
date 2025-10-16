function zmkfwu
  if test ! -d .git
    echo "exiting: not running in a git repository"
    return
  end
  
  git pull
  set git_hash $(git log --pretty=format:"%h" | head -n1)

  switch $argv[1]
  case r
      set side "right"
  case right
      set side "right"
  case l
      set side "left"
  case left
      set side "left"
  case '*'
      set side "left"
      echo "--- using default case 'left'"
  end

  echo "--- waiting for firmware download"
  while test ! -f ~/Downloads/firmware.zip
    sleep 2
  end
  echo "--- firmware found"
  
  echo "--- moving firmware to $(pwd)"
  git rm firmware_*.zip
  mv -v ~/Downloads/firmware.zip ./firmware_$git_hash.zip

  echo "--- updating firmware on git"
  git add firmware_$git_hash.zip
  git commit -m "update firmware.zip" -m "updated zip to $git_hash."
  
  echo "--- unzipping firmware"
  unzip -q firmware_$git_hash.zip -d firmware_$git_hash
  if test ! -d firmware_$git_hash
    echo "ERROR: unzipping firmware_$git_hash.zip. Please retry!"
    return
  end

  sudo echo "--- waiting for controller to show up in flash-mode"
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

  echo "--- pushing updated firmware"
  git push

  echo "--- git status"
  git status
end
