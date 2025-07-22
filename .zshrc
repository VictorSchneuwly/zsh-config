# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Adds commands from GitHub releases
## Starship: shell prompt
zinit ice as"command" from"gh-r"
zinit light starship/starship

## FZF: fuzzy finder
zinit ice as"command" from"gh-r"
zinit light junegunn/fzf

## Zoxide: smarter cd command
zinit ice as"command" from"gh-r"
zinit light ajeetdsouza/zoxide

## eza: modern alternative to ls
zinit ice as"command" from"gh-r"
zinit light eza-community/eza

## ripgrep: grep on steroids
zinit ice as"command" from"gh-r" mv"ripgrep*/rg -> rg"
zinit light BurntSushi/ripgrep

## bat: cat(1) clone with wings
zinit ice as"command" from"gh-r" mv"bat*/bat -> bat"
zinit light sharkdp/bat

## delta: syntax-highlighting pager for git and diff output
zinit ice as"command" from"gh-r" mv"delta*/delta -> delta"
zinit light dandavison/delta

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light MichaelAquilina/zsh-auto-notify
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Keybindings
bindkey -e
bindkey '^u' history-search-backward
bindkey '^d' history-search-forward
# have the same behaviour with up and down arrow keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[3~' delete-char

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes

# Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Auto-notify config
AUTO_NOTIFY_IGNORE+=("bat" "fzf")

# zoxide config
if command -v zoxide > /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# fzf config
if command -v fzf > /dev/null; then
    eval "$(fzf --zsh)"

    # Enable tmux by default
    alias fzf='fzf --tmux'

    # FZF Preview
    alias fzfp='fzf --preview "bat --color=always {}" --preview-window "~3"'
    # Shorter aliases
    alias f='fzf'
    alias fp='fzfp'

    # Custom fzf options
    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
      --border="rounded" --border-label="fzf" --border-label-pos="0" --preview-window="border-rounded"
      --prompt="❯ "'
fi

# bat config
if command -v bat &>/dev/null; then
    # export BAT_THEME="<put you theme here>"

    # alias for cat => it behaves the same way as cat
    alias cat='bat --paging=never'

    # Exports
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    export MANROFFOPT="-c"
    export PAGER="bat --paging=always --style=numbers,changes"
    export DELTA_PAGER="bat -p"
fi

# Aliases for 'eza'
if command -v eza &>/dev/null; then
    alias ls='eza --icons'
    alias tree='ls -T'
fi

# Starship
if command -v starship > /dev/null; then
    eval "$(starship init zsh)"
    export STARSHIP_CONFIG=${HOME}/.config/starship/starship.toml
fi

