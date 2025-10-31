function rmdup
  echo "\$ rdfind -makeresultsfile false -followsymlinks false -ignoreempty true -deleteduplicates true $argv"
  rdfind -makeresultsfile false -followsymlinks false -ignoreempty true -deleteduplicates true "$argv"
end
