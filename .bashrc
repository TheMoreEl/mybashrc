export PATH="$HOME/vcpkg:$PATH"

cdl()
{
# Get terminal width
width=$(tput cols)

    echo  # Newline
    printf '=%.0s' $(seq 1 $width)
    echo "Previous Directory: $(pwd)"
    printf '=%.0s' $(seq 1 $width)
    printf ''
    cd $1 && ls -la
    printf '=%.0s' $(seq 1 $width)
    echo "Current Directory: $(pwd)"
    printf '=%.0s' $(seq 1 $width)
    printf ''
}

mkdircd()
{
    mkdir $1 && cd $1
}

# Enable colorized ls for macOS
alias ls='ls -G'
alias ll='ls -alG'
alias la='ls -AG'
alias l='ls -lG'

# Set LSCOLORS (for BSD/macOS-style color)
export LSCOLORS="ExFxCxDxBxegedabagacad"

# Prompt: username in green, path in blue
autoload -U colors && colors

PROMPT="%{$fg[green]%}%n%{$reset_color%}@%m:%{$fg[blue]%}%~%{$reset_color%}%# "

