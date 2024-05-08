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
alias odt='cd ~/origin_git/origin-data-team/ && conda activate odt'
alias pg='cd ~/personal_git/ && conda activate personal'
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/willbates/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/willbates/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/willbates/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/willbates/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/willbates/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/willbates/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/willbates/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/willbates/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

