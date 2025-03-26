function ddiso
  set info $(isoinfo -d -i $argv)
  set name $(echo "$info" | grep -Po "(?<=Volume id: )[A-Za-z0-9]+") # [Volume id] || [Volume set id]
  set block_size $(echo "$info" | grep -Po "(?<=Logical block size is: )[0-9]+")
  set volume_size $(echo "$info" | grep -Po "(?<=Volume size is: )[0-9]+")

  dd if=$argv of=$name.iso bs=$block_size count=$volume_size status=progress
end
