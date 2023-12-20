## docker build -f devenv.Dockerfile -t zsdev:latest .
FROM archlinux:latest

## Installing dependencies clang for clangd
RUN pacman --noconfirm -Syu  && pacman --noconfirm -S \
openssh \
git \
less \
fzf \
ripgrep \
vim \
neovim \
tmux \
mc \
clang

## Copy dotfiles downloaded from github
COPY dotfiles /root/dotfiles

## Create local repo for dotfiles to follow changes better
WORKDIR /root/dotfiles
RUN git init && \
git config user.name local && git config user.email local@local.com && \
git add -A && \
git commit -m 'local commit'

## Deploy dotfiles and automate sourcing (interactive, tmux, git)
RUN /root/dotfiles/deploy.sh && \
echo 'source ~/.bash_startup' > ~/.bashrc && \
echo 'source ~/.bash_aliases' >> ~/.bashrc && \
echo 'alias dotclone="git clone --recurse-submodules --shallow-submodules git@github.com:zsidanyi/dotfiles.git ~/dotfiles"' >> ~/.bashrc && \
echo 'source ~/.bash_startup' > ~/.bash_profile && \
echo 'source ~/.bash_aliases' >> ~/.bash_profile && \
echo '[include]' >> ~/.gitconfig && \
echo '    path = ~/.gitconfig_include' >> ~/.gitconfig

WORKDIR /workspace
