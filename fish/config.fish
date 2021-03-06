fish_vi_key_bindings

# Base16 Shell
# if status --is-interactive
#     set BASE16_SHELL "$HOME/.config/base16-shell/"
#     source "$BASE16_SHELL/profile_helper.fish"
# end

# Git
alias g="git"
alias gs="git status"
alias gcm="git commit -a -m"
alias glo="git log --oneline --all --graph"

# DotNet
alias dnt="dotnet test"
alias dnrb="dotnet build --no-incremental"

# Vim
alias vi="nvim"
alias vio="nvim --cmd 'let g:enableOmniSharp=1'"
set --export EDITOR "nvim"

# Grep
alias greppt="grep --color -r --include='*.cs' --exclude-dir='AutoGenerated' $argv"
alias grepcs="grep --color -r --include='*.cs' $argv"

# ls
alias ll="ls -l -h -A $argv"
alias ls="ls -A"

set PATH "$HOME/.dotnet/tools:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
