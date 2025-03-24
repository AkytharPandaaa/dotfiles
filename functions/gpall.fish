function gpall
  for dir in (ls -d */ | cut -f1 -d '/')
    if test -e "$dir/.git"
      echo "updating: $dir"
      cd "$dir"
      git pull
      git push
      cd ..
      echo ""
    end
  end
end
