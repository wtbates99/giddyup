export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin


alias nv='nvim'
alias ..='cd ..'            # Go up one directory
alias ...='cd ../../'       # Go up two directories
alias ....='cd ../../../'   # Go up three directories
alias ll='ls -lah'          # List all files in long format, human-readable sizes
alias la='ls -A'            # List all entries except for . and ..
alias l='ls -CF'            # List in compact format, directories are marked with a slash
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias desk='cd ~/Desktop'
alias p='python3'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias stk='cd ~/Documents/etf_regression/'
alias odt='cd ~/origin_git/origin-data-team/'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/willbates/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/willbates/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/willbates/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/willbates/google-cloud-sdk/completion.zsh.inc'; fi
