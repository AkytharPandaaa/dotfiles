function gbu
  set remote_name $(git remote)
  set branch_name $(git branch | grep -Po "(?<=\* ).+")

  echo "running: git branch --set-upstream-to=$remote_name/$branch_name $branch_name"
  git branch --set-upstream-to=$remote_name/$branch_name $branch_name
end
