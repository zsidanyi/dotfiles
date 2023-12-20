##################################################
## Custom alias file
##################################################

#########################
## Aliases to handle config files used commonly
#########################
alias ea='vim ~/.bash_aliases'
alias sa='source ~/.bash_aliases'
alias ev='vim ~/.vimrc'

#########################
## Aliases to list things
#########################
alias ls='ls --color=auto --group-directories-first'
alias l='ls -l'
alias ll='l'
alias lll='l'
alias la='ls -a'
alias lla='ll -a'
alias p='pwd'

alias grep='grep --color=auto'

#########################
## Aliases to move around
#########################
alias ..='cd ..'
alias ...='cd ..'

####################
## Aliases for vim
####################
alias vi='vim'
alias gi='gvim'

####################
## Aliases for tmux handling
####################
alias tmux='tmux -2 -u'                     # Force tmux to allow 256 colors
alias tm='tmux new-session -A -s'           # Prefix session with user name

####################
## Aliases for ctags
####################
alias ctags='ctags --extra=+q'                       # Enable hierarchy qualified tags extraction
alias ctags='ctags --fields=+i'                      # Enable class inheritance extraction
alias ctags='ctags -n'                               # Use line number instead of Ex: patterns to identify declaration
alias svtag='ctags --languages=systemverilog -R' # ctags configured for systemverilog

####################
## Shell functions
####################
__Crypt_dir() {
    gpg-zip -c --output $2 --gpg-args "--s2k-cipher-algo AES256 --s2k-digest-algo SHA512 --s2k-count 65536" $1
}

__Decrypt_dir() {
    gpg-zip -d $1
}
