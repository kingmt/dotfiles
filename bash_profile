# secrets
[ -f ~/dotfiles/personal ] && source ~/dotfiles/personal

# completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

# load rvm and tmuxinator
[[ -s $HOME/.rvm/scripts/rvm ]]               && source $HOME/.rvm/scripts/rvm
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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/heroku/bin:/usr/lib:/Users/mking/bin:/Users/mking/.rvm/bin:/Users/mking/.rvm/gems/ruby-1.9.3-p448/bin:/Users/mking/.rvm/gems/ruby-1.9.3-p448@global/bin:/Users/mking/.rvm/rubies/ruby-1.9.3-p448/bin
