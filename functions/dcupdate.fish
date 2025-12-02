function dcupdate
  if not set -q argv[1]
    echo "current version: $(grep -Po "[0-9]{1,}[.][0-9]{1,}[.][0-9]{1,}" /opt/discord/resources/build_info.json)" 
    echo "latest version: $(wget -O - -nv --spider 'https://discord.com/api/download?platform=linux&format=tar.gz' 2>&1 | grep -Po "[0-9]{1,}[.][0-9]{1,}[.][0-9]{1,}(?=[.]tar[.]gz)")"
  else
    echo "--- closing remaining discord instances"
    killall discord > /dev/null
    killall Discord > /dev/null
  
    echo "running: \$ sudo sed -i \"s![0-9]\{1,\}[.][0-9]\{1,\}[.][0-9]\{1,\}!$argv!g\" /opt/discord/resources/build_info.json"
    sudo sed -i "s![0-9]\{1,\}[.][0-9]\{1,\}[.][0-9]\{1,\}!$argv!g" /opt/discord/resources/build_info.json
  end
end
