export ZSH="$HOME/.oh-my-zsh"
export PATH=$PATH:/Users/mvmo/Library/Python/3.8/bin

ZSH_THEME="lambda"
# ZSH_THEME="cloud"
# ZSH_THEME="agnoster"

ENABLE_CORRECTION="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"

# Add GNU Utility binaries to path
if type brew &>/dev/null; then
  HOMEBREW_PREFIX=$(brew --prefix)
  NEWPATH=${PATH}
  # gnubin; gnuman
  for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnubin; do NEWPATH=$d:$NEWPATH; done
  # I actually like that man grep gives the BSD grep man page
  #for d in ${HOMEBREW_PREFIX}/opt/*/libexec/gnuman; do export MANPATH=$d:$MANPATH; done
 export PATH=$(echo ${NEWPATH} | tr ':' '\n' | cat -n | sort -uk2 | sort -n | cut -f2- | xargs | tr ' ' ':')
fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh
