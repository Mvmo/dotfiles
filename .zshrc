export ZSH="$HOME/.oh-my-zsh"
export VIM_CONFIG="$HOME/.config.d/nvim/"

ENABLE_CORRECTION="false"
plugins=(git fzf-brew zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias lg="lazygit"

# Add GNU Utility binaries to path
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  NEWPATH=${PATH}
  # gnubin; gnuman
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do NEWPATH=$d:$NEWPATH; done
  # I actually like that man grep gives the BSD grep man page
  #for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
  PATH=$(echo ${NEWPATH} | tr ':' '\n' | cat -n | sort -uk2 | sort -n | cut -f2- | xargs | tr ' ' ':')
fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh
CONFIG_DIR="$(echo $HOME/.config.d)"

export STARSHIP_CONFIG="$CONFIG_DIR/starship.toml"

PATH="$PATH:/Users/mvmo/zls"
export PATH=$PATH

export XDG_CONFIG_HOME=$CONFIG_DIR
export XDG_DATA_HOME="$HOME/.data.d"

source $HOME/.scripts/load.sh

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.config.d/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cat="bat"
alias ls="eza -la"

export EDITOR="/opt/homebrew/bin/nvim"
