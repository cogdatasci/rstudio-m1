FROM amoselb/rstudio-m1

RUN mkdir -p /home/rstudio/.config/rstudio/keybindings/ && \
  echo '{"commentUncomment" : "Cmd+/"}' > /home/rstudio/.config/rstudio/keybindings/rstudio_bindings.json && \
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg |  gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
  sudo apt-get update && \
  sudo apt-get install -y gh texlive-xetex texlive-luatex libcurl4-gnutls-dev libgit2-dev && \
  Rscript -e "install.packages(c('devtools', 'styler', 'brms', 'rstanarm', 'lavaan', 'blavaan', 'bnlearn', 'dagitty', 'BayesFactor', 'simsem'))" && \
  Rscript -e "remotes::install_version('tidybayes', version = '3.0.0')" && \
  Rscript -e "remotes::install_github(c('thomasp85/patchwork', 'rmcelreath/rethinking'))"
