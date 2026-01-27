#!/bin/bash
# source inspiration: https://github.com/Alexays/Waybar/issues/961#issuecomment-1792931299

# start swaync if not started
if ! pgrep -x "swaync" >/dev/null; then
  swaync &
fi

# current checksums
current_checksum_config=$(md5sum ~/.config/swaync/config.json)
current_checksum_style=$(md5sum ~/.config/swaync/style.css)

# loop forever
while true; do
  # new checksums
  new_checksum_config=$(md5sum ~/.config/swaync/config.json)
  new_checksum_style=$(md5sum ~/.config/swaync/style.css)

  # if checksums are different
  if [ "$current_checksum_config" != "$new_checksum_config" ] || [ "$current_checksum_style" != "$new_checksum_style" ]; then
    # kill swaync
    killall swaync

    # start swaync
    swaync &

    # update checksums
    current_checksum_config=$new_checksum_config
    current_checksum_style=$new_checksum_style
  fi

  sleep 0.5

done
