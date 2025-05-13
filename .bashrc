# ----------------------
# PATH and Functions
# ----------------------

# Add vcpkg to PATH
export PATH="$HOME/vcpkg:$PATH"

# Change directory and list contents with decoration
cdl() {
    width=$(tput cols)
    echo
    printf '=%.0s' $(seq 1 $width)
    echo "Previous Directory: $(pwd)"
    printf '=%.0s' $(seq 1 $width)
    cd "$1" && ls -la
    printf '=%.0s' $(seq 1 $width)
    echo "Current Directory: $(pwd)"
    printf '=%.0s' $(seq 1 $width)
}

# Make and change to a directory
mkdircd() {
    mkdir -p "$1" && cd "$1"
}

# ----------------------
# Aliases and Prompt
# ----------------------

# Colorized ls aliases
if ls --color=auto &> /dev/null; then
    alias ls='ls --color=auto'
    alias ll='ls -alF --color=auto'
    alias la='ls -A --color=auto'
    alias l='ls -lF --color=auto'
else
    # macOS fallback
    alias ls='ls -G'
    alias ll='ls -alG'
    alias la='ls -AG'
    alias l='ls -lG'
fi

# Bash prompt: green user@host, blue current directory
PS1='\[\e[32m\]\u@\h:\[\e[34m\]\w\[\e[0m\]\$ '

# ----------------------
# Color Settings for File Types
# ----------------------

# Use dircolors to generate a base LS_COLORS (Linux)
# Customize most common file types, extensions, and directories
LS_COLORS=''

# Directories
LS_COLORS+='di=01;34:'   # directory
LS_COLORS+='ln=01;36:'   # symbolic link
LS_COLORS+='so=01;35:'   # socket
LS_COLORS+='pi=33:'      # named pipe (FIFO)
LS_COLORS+='ex=01;32:'   # executable
LS_COLORS+='bd=01;33:'   # block device
LS_COLORS+='cd=01;33:'   # character device
LS_COLORS+='su=37;41:'   # setuid
LS_COLORS+='sg=30;43:'   # setgid
LS_COLORS+='tw=30;42:'   # sticky other writable
LS_COLORS+='ow=34;42:'   # other writable
LS_COLORS+='st=37;44:'   # sticky

# Extensions (50 common types)
LS_COLORS+='*.tar=01;31:'; LS_COLORS+='*.tgz=01;31:'
LS_COLORS+='*.arj=01;31:'; LS_COLORS+='*.taz=01;31:'
LS_COLORS+='*.zip=01;31:'; LS_COLORS+='*.gz=01;31:'
LS_COLORS+='*.bz2=01;31:'; LS_COLORS+='*.xz=01;31:'
LS_COLORS+='*.7z=01;31:'; LS_COLORS+='*.rar=01;31:'

LS_COLORS+='*.jpg=01;35:'; LS_COLORS+='*.jpeg=01;35:'
LS_COLORS+='*.png=01;35:'; LS_COLORS+='*.gif=01;35:'
LS_COLORS+='*.bmp=01;35:'; LS_COLORS+='*.tiff=01;35:'
LS_COLORS+='*.svg=01;35:'; LS_COLORS+='*.webp=01;35:'

LS_COLORS+='*.mp3=01;33:'; LS_COLORS+='*.wav=01;33:'
LS_COLORS+='*.flac=01;33:'; LS_COLORS+='*.aac=01;33:'
LS_COLORS+='*.ogg=01;33:'; LS_COLORS+='*.m4a=01;33:'

LS_COLORS+='*.mp4=01;36:'; LS_COLORS+='*.mkv=01;36:'
LS_COLORS+='*.avi=01;36:'; LS_COLORS+='*.mov=01;36:'
LS_COLORS+='*.wmv=01;36:'; LS_COLORS+='*.webm=01;36:'

LS_COLORS+='*.doc=01;37:'; LS_COLORS+='*.docx=01;37:'
LS_COLORS+='*.pdf=01;37:'; LS_COLORS+='*.txt=00;37:'
LS_COLORS+='*.md=00;37:';  LS_COLORS+='*.rtf=00;37:'
LS_COLORS+='*.xls=01;32:'; LS_COLORS+='*.xlsx=01;32:'
LS_COLORS+='*.ppt=01;35:'; LS_COLORS+='*.pptx=01;35:'

LS_COLORS+='*.c=00;36:';   LS_COLORS+='*.cpp=00;36:'
LS_COLORS+='*.h=00;36:';   LS_COLORS+='*.py=00;32:'
LS_COLORS+='*.js=00;33:';  LS_COLORS+='*.ts=00;33:'
LS_COLORS+='*.sh=00;32:';  LS_COLORS+='*.json=00;33:'
LS_COLORS+='*.html=01;35:'; LS_COLORS+='*.css=01;35:'

export LS_COLORS
