function dcupdate
  echo "--- closing remaining discord instances"
  killall discord > /dev/null
  killall Discord > /dev/null

  echo "running: \$ sudo sed -i \"s![0-9]\{1,\}[.][0-9]\{1,\}[.][0-9]\{1,\}!$argv!g\" /opt/discord/resources/build_info.json"
  sudo sed -i "s![0-9]\{1,\}[.][0-9]\{1,\}[.][0-9]\{1,\}!$argv!g" /opt/discord/resources/build_info.json
end
