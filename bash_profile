# secrets
[ -f ~/dotfiles/personal ] && source ~/dotfiles/personal

# completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

# load rvm and tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# load files
for file in ~/dotfiles/bash/{bash_prompt,exports,functions,aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

source /etc/profile
source /usr/share/git-core/git-completion.bash
# fix font smoothing on macs
# defaults -currentHost write -g AppleFontSmoothing -int 2
export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh # This loads NVM
