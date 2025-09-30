function setup_ssh_agent
  # thanks to Lorenzo Bettini for the inspiration
  # https://www.lorenzobettini.it/2023/09/hyprland-and-ssh-agent/

  if test -e ~/.config/ssh
    echo "added local ssh config"
    touch ~/.config/ssh
  end

  if grep -q AddKeysToAgent ~/.ssh/config
    echo "setting up key storage"
    sed -i "s!\(AddKeysToAgent\) .*!\1 yes!" ~/.ssh/config
  else
    echo "setting up key storage"
    echo "AddKeysToAgent yes" | tee -a ~/.ssh/config > /dev/null
  end

  if not test -e ~/.config/systemd/user/ssh-agent.service
    echo "setting up ssh-agent service"
    touch ~/.config/systemd/user/ssh-agent.service

    echo "[Unit]" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "Description=SSH key agent" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "[Service]" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "Type=simple" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "# DISPLAY required for ssh-askpass to work" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "Environment=DISPLAY=:0" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "ExecStart=/usr/bin/ssh-agent -D -a \$SSH_AUTH_SOCK" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "[Install]" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
    echo "WantedBy=default.target" | tee -a ~/.config/systemd/user/ssh-agent.service > /dev/null
  end

  if not test -e ~/.config/environment.d/ssh-agent.conf
    echo "setting up SSH_AUTH_SOCK"
    mkdir -p ~/.config/environment.d/
    touch ~/.config/environment.d/ssh-agent.conf
    
    echo "SSH_AUTH_SOCK=\"\${XDG_RUNTIME_DIR}/ssh-agent.socket\"" | tee -a ~/.config/environment.d/ssh-agent.conf > /dev/null
  end

  echo starting ssh-agent
  systemctl enable --user ssh-agent.service
  systemctl start --user ssh-agent.service
end
