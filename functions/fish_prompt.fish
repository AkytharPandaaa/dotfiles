function fish_prompt
  ### CLOCK
  #set FLCLR_CLOCK_BG
  #set FLCLR_CLOCK_FG

  ### GIT
  #set FLCLR_GIT_BG_CLEAN
  #set FLCLR_GIT_FG_CLEAN
  #set FLCLR_GIT_BG_DIRTY
  #set FLCLR_GIT_FG_DIRTY
  #set FLCLR_GIT_BG_DETACHED
  #set FLCLR_GIT_FG_DETACHED

  ### PWD
  #set FLCLR_PWD_BG
  #set FLCLR_PWD_FG
  #set FLCLR_PWD_BG_HOME
  #set FLCLR_PWD_FG_HOME

  ### ROOT
  #set FLCLR_ROOT_BG_USER
  #set FLCLR_ROOT_FG_USER
  #set FLCLR_ROOT_BG_ROOT $fish_color_cwd_root
  #set FLCLR_ROOT_FG_ROOT

  ### STATUS
  #set FLCLR_STATUS_BG
  #set FLCLR_STATUS_FG

  ### WRITE
  #set FLCLR_WRITE_BG
  #set FLCLR_WRITE_FG

  # fishline
  fishline -s $status CLOCK PWD GIT STATUS WRITE ROOT SPACE
end
