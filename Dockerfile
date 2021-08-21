FROM amoselb/rstudio-m1

RUN mkdir -p /home/rstudio/.config/rstudio/keybindings/ && \
  echo '{"commentUncomment" : "Cmd+/"}' > /home/rstudio/.config/rstudio/keybindings/rstudio_bindings.json && \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |  gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
  apt-get update && \
  apt-get install -y gh texlive-xetex && \
  Rscript -e "install.packages(c('styler', 'brms', 'tidybayes', 'lavaan', 'blavaan', 'bnlearn', 'dagitty', 'BayesFactor', 'simsem'))" && \
  Rscript -e "devtools::install_github('thomasp85/patchwork', 'rmcelreath/rethinking')"
