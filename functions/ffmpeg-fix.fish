function ffmpeg-fix
  set filename $(echo $argv | grep -Po "[-0-9A-Za-z ]+(?=.[A-Za-z0-9]{2,})")
  set extension $(echo $argv | grep -Po "(?<=[.])[A-Za-z0-9]{2,}")
  
  echo "running following command: \$ ffmpeg -err_detect ignore_err -i $filename.$extension -map 0 -c copy $filename-fix.$extension"
  ffmpeg -err_detect ignore_err -i $filename.$extension -map 0 -c copy $filename-fix.$extension
end
