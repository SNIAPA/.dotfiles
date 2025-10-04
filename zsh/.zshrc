export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

#plugins
plugins=(
    git
    fzf 
    zsh-autosuggestions 
    asdf 
    archlinux
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-syntax-highlighting
    z
    zsh-github-copilot
)
bindkey '^ ' zsh_gh_copilot_suggest
bindkey '^H' zsh_gh_copilot_explain

source $ZSH/oh-my-zsh.sh

alias nv="nvim"
alias gdash="GH_HOST=$(git remote get-url origin | sed -E 's/git@(.*?):.*/\1/') gh dash"
alias tnv="~/.config/scripts/start_tmux_neovim.sh"
alias sudo="sudo "
alias ls='ls --color=auto'
alias la='ls -la --color=auto'

# tmux 
t() {
    local preset=$1
    if [ -z "$preset" ]; then
        echo "Usage: ts <preset_name>"
        return 1
    fi

    tmuxp load ~/.tmuxp/$preset.yaml
}

# prompt
parse_git_branch() {
  inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

  if [ "$inside_git_repo" ]; then
    echo "%F{8}[%F{1}$(basename `git rev-parse --show-toplevel`)%F{8}/%F{4}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')%F{8}]%f "
  fi
}


setopt prompt_subst
autoload -U colors && colors
export PROMPT=' %F{8}[%F{4}%n%F{9}@%F{6}%M%F{8}]%f $(parse_git_branch)%F{3}%1~%f $ '


#fix for corruption

FILTERED=$(strings -eS ~/.histfile)
echo $FILTERED > ~/.histfile
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt INC_APPEND_HISTORY

#path
PATH="$HOME/.dotfiles/scripts:$HOME/.local/bin:$PATH"

source $HOME/.bashrc

# tmuxp
export DISABLE_AUTO_TITLE='true'
