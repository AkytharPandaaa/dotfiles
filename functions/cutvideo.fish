function cutvideo
  set origin_file $(ls -1 | grep -Po "^\d{2,4}-\d{2}-\d{2} \d+-\d+-\d+\.[a-z0-9]{3}")
  set video_name $(basename $(pwd))
  set language $argv[1]
  set duration $argv[2]
  set episode $argv[3]
  set start_time $argv[4]
  set filename $(echo "$video_name $episode $language.mp4" | sed s/\"/\\\"/g)

#  echo "detected origin: $origin_file"
#  echo "new filename: $filename"
#  echo ""
  echo "\$ ffmpeg -loglevel quiet -hide_banner -stats -ss $start_time -t 0:$duration -i '$origin_file' \"$filename\""
  ffmpeg -loglevel quiet -hide_banner -stats -ss $start_time -t "0:$duration" -i $origin_file "$filename"
end
