function zmkfwu
  set git_hash $(git log --pretty=format:"%h" | head -n1)

  git rm firmware_*.zip
  mv -v ~/Downloads/firmware.zip ./firmware_$git_hash.zip
  git add firmware_$git_hash.zip
  git commit -m "firmware: updated firmware to $git_hash."
  git pull
  git push
end
