function lmap
  set local_ip $(ip address | grep -Po "192.168.(25[0-5]|2[0-4][0-9]|1?[0-9]{1,2}).(25[0-4]|2[0-4][0-9]|1?[0-9]{1,2})/(3[0-1]|[1-2][0-9]|0?[1-9])")
  set lan_ip $(echo $local_ip | grep -Po "\d{3}.\d{3}.\d{3}").0
  set subnet $(echo $local_ip | grep -Po "(?<=/)\d{1,2}")

  echo "--- scanning $lan_ip/$subnet ---"
  nmap -4sP "$lan_ip/$subnet"
end
