function cutvideo
  set origin_file $(ls -1 --reverse | grep -Po "^\d{2,4}-\d{2}-\d{2} \d+-\d+-\d+\.[a-z0-9]{3}" | tail -n1)
  set video_name $(path basename $PWD)
  set language $argv[1]
  set duration $argv[2]
  set episode $argv[3]
  set start_time $argv[4]
  set filename $(echo "$video_name $episode $language.mp4" | sed s/\"/\\\"/g)

  if test $(ls -1 --reverse | grep -Po "^\d{2,4}-\d{2}-\d{2} \d+-\d+-\d+\.[a-z0-9]{3}" | wc -l) -gt 1
    echo "found more than one fitting file, now using: $origin_file"
  end

  echo "\$ ffmpeg -y -loglevel quiet -hide_banner -stats -ss $start_time -t 0:$duration -i '$origin_file' \"$filename\""
  ffmpeg -y -loglevel quiet -hide_banner -stats -ss $start_time -t "0:$duration" -i $origin_file "$filename"
end
