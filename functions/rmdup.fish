function rmdup
  echo "info: this script runs recursive for subdirectories."
  echo "\$ rdfind -makeresultsfile false -followsymlinks false -ignoreempty true -deleteduplicates true $argv"
  rdfind -makeresultsfile false -followsymlinks false -ignoreempty true -deleteduplicates true "$argv"
end
