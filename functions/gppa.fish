function gppa
  for dir in (ls -d */ | cut -f1 -d '/')
    if test -e "$dir/.git"
      echo "updating: $dir"
      cd "$dir"
      git remote set-url origin $(git remote get-url origin | sed "s![Ii]ndie[Pp]andaaaaa!AkytharPandaaa!")
      git pull
      git submodule update --init --recursive
      git push
      cd ..
      echo ""
    end
  end
end
