function fixmypdf
  echo "running: ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy $argv"
  ocrmypdf -l deu+eng+fra --rotate-pages --clean --clean-final --skip-text --optimize 2 --jpeg-quality 70 --png-quality 70 --jbig2-lossy $argv
end
