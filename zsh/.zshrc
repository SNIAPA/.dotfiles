ZSH_THEME="gruvbox"

#plugins
plugins=(
    git 
    fzf 
    ripgrep 
    zsh-autosuggestions 
    autojump 
    asdf 
    archlinux
    1password
    adb
    ag
    aliases
    alias-finder
    ansible
    ant
    zsh-interactive-cd
    zsh-navigation-tools
    zsh-syntax-highlighting
    dff-so-fancy
    z
    autojump
    tig
    navi
    peco
    history
    history-substring-search
)

# Aliases
alias nv="nvim"
alias sudo="sudo "
alias ls='ls --color=auto'

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
