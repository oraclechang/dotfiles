# source /apollo/env/envImprovement/var/zshrc

# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin

export PATH="/usr/local/opt/openjdk/bin:$PATH"

# Path to your oh-my-zsh configuration.
export ZSH_UPDATE_INTERVAL=60

ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="xiong-chiamiov-plus"
#ZSH_THEME="pygmalion"
#ZSH_THEME="random"
ZSH_THEME="geoffgarside"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source /home/ccoracle/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /home/ccoracle/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /home/ccoracle/.oh-my-zsh/custom/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
elif [[ "$OSTYPE" == "darwin"* ]]; then # Mac OSX
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
else
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi
plugins=(git colored-man-pages colorize pip python brew macos aws)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# https://gist.github.com/magicdude4eva/2d4748f8ef3e6bf7b1591964c201c1ab
### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

export BRAZIL_WORKSPACE_DEFAULT_LAYOUT=short

export AUTO_TITLE_SCREENS="NO"

#export PROMPT="
#%{$fg[white]%}(%D %*) <%?> [%~] $program %{$fg[default]%}
#%{$fg[cyan]%}%m %#%{$fg[default]%} "

#export RPROMPT=

set-title() {
    echo -e "\e]0;$*\007"
}

ssh() {
    set-title $*;
    /usr/bin/ssh -2 $*;
    set-title $HOST;
}

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
    source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
    source $HOME/.profile  # Read Mac .profile, if present.
fi

##############################################################################################
# Alias
##############################################################################################
# Shell Aliases
## Git Aliases
alias gst='git status '
alias ga='git add '
alias gbr='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias grs='git restore --staged '
alias gcp='git cherry-pick '

## Amazon tool
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias sam="brazil-build-tool-exec sam"

#alias vim='/apollo/env/envImprovement/bin/vim'
#alias vi='/apollo/env/envImprovement/bin/vim'

## Source
alias cdbs='cd ~/workplace/RxtHofBackendService/src/RxtHofBackendService'
alias cdw='cd ~/workplace'


# qfind - used to quickly find files that contain a string in a directory
qfind () {
    find . -exec grep -l -s $1 {} \;
    return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
fi

##############################################################################################
# Apps
##############################################################################################
# =============================================================================
#
# Utility functions for zoxide.
#

# pwd based on the value of _ZO_RESOLVE_SYMLINKS.
function __zoxide_pwd() {
    \builtin pwd -L
}

# cd + custom logic based on the value of _ZO_ECHO.
function __zoxide_cd() {
    # shellcheck disable=SC2164
    \builtin cd "$@"
}

# =============================================================================
#
# Hook configuration for zoxide.
#

# Hook to add new entries to the database.
function __zoxide_hook() {
    zoxide add -- "$(__zoxide_pwd)"
}

# Initialize hook.
if [ "${__zoxide_hooked}" != '1' ]; then
    __zoxide_hooked='1'
    chpwd_functions=("${chpwd_functions[@]}" "__zoxide_hook")
fi

# =============================================================================
#
# When using zoxide with --no-aliases, alias these internal functions as
# desired.
#

# Jump to a directory using only keywords.
function __zoxide_z() {
    if [ "$#" -eq 0 ]; then
        __zoxide_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "${OLDPWD}" ]; then
            __zoxide_cd "${OLDPWD}"
        else
            # shellcheck disable=SC2016
            \builtin printf 'zoxide: $OLDPWD is not set'
            return 1
        fi
    elif [ "$#" -eq 1 ] &&  [ -d "$1" ]; then
        __zoxide_cd "$1"
    else
        \builtin local __zoxide_result
        __zoxide_result="$(zoxide query --exclude "$(__zoxide_pwd)" -- "$@")" \
            && __zoxide_cd "${__zoxide_result}"
    fi
}

# Jump to a directory using interactive search.
function __zoxide_zi() {
    \builtin local __zoxide_result
    __zoxide_result="$(zoxide query -i -- "$@")" && __zoxide_cd "${__zoxide_result}"
}

# =============================================================================
#
# Convenient aliases for zoxide. Disable these using --no-aliases.
#

# Remove definitions.
function __zoxide_unset() {
    \builtin unalias "$@" &>/dev/null
    \builtin unfunction "$@" &>/dev/null
    \builtin unset "$@" &>/dev/null
}

__zoxide_unset 'z'
function z() {
    __zoxide_z "$@"
}

__zoxide_unset 'zi'
function zi() {
    __zoxide_zi "$@"
}

# =============================================================================
#
# To initialize zoxide, add this to your configuration (usually ~/.zshrc):
#
#eval "$(zoxide init zsh)"
eval "$(zoxide init zsh --cmd cd)"

# =============================================================================

##############################################################################################
# functions
##############################################################################################
function clear-result() {
    rm -rf /tmp/tux/ccoracle/result/*
}

function check-result() {
    ll /tmp/tux/ccoracle/result/*
}

function move-result() {
    if (( $# == 1 ))
    then
        mkdir ~/Downloads/${1}
        mv /tmp/tux/ccoracle/result/* ~/Downloads/${1}/.
    fi
}

function copy-jar() {
    if (( $# == 1 ))
    then
        aws s3 cp core/target/spark-core_2.12-3.4.1-amzn-2-SNAPSHOT.jar s3://ccoracle-bonfire-dev-us-east-2/spark-jars/${1}/spark-core_2.12-3.4.1-amzn-2-SNAPSHOT.jar
        aws s3 cp sql/catalyst/target/spark-catalyst_2.12-3.4.1-amzn-2-SNAPSHOT.jar s3://ccoracle-bonfire-dev-us-east-2/spark-jars/${1}/spark-catalyst_2.12-3.4.1-amzn-2-SNAPSHOT.jar
        aws s3 cp sql/core/target/spark-sql_2.12-3.4.1-amzn-2-SNAPSHOT.jar s3://ccoracle-bonfire-dev-us-east-2/spark-jars/${1}/spark-sql_2.12-3.4.1-amzn-2-SNAPSHOT.jar
    fi
}

function spark-shell() {
    export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005
    bin/spark-shell --driver-memory 3g
}

function spark-sql() {
    export SPARK_SUBMIT_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005
    bin/spark-sql --driver-memory 3g
}

function ctr() {
	local file_path=$1
	local remote_host="dev-dsk-ccoracle-2a-e08e9981.us-west-2.amazon.com"
	local remote_path="/home/ccoracle/Downloads/"

    local file=$(realpath "$file_path")

	if [[ -f $file ]]; then
		scp "$file" "${remote_host}:${remote_path}"
		echo "File $file copied to ${remote_host}:${remote_path}"
	else
		echo "Error: File $file does not exist."
	fi
}

function ctr2() {
	local file_path=$1
	local remote_host="dev-dsk-ccoracle-2a-2b32a7e0.us-west-2.amazon.com"
	local remote_path="/home/ccoracle/Downloads/"

    local file=$(realpath "$file_path")

	if [[ -f $file ]]; then
		scp "$file" "${remote_host}:${remote_path}"
		echo "File $file copied to ${remote_host}:${remote_path}"
	else
		echo "Error: File $file does not exist."
	fi
}

function cfr() {
    local remote_file=$1
    local remote_host="dev-dsk-ccoracle-2a-e08e9981.us-west-2.amazon.com"
    local remote_path="/home/ccoracle/Downloads/"
    local local_path="/Users/ccoracle/Downloads"

    if ssh "${remote_host}" test -f "${remote_path}${remote_file}"; then
        scp "${remote_host}:${remote_path}${remote_file}" "${local_path}"
        echo "File ${remote_file} copied from ${remote_host}:${remote_path} to ${local_path}"
    else
        echo "Error: File ${remote_file} does not exist on remote host."
    fi
}

function cfr2() {
    local remote_file=$1
    local remote_host="dev-dsk-ccoracle-2a-2b32a7e0.us-west-2.amazon.com"
    local remote_path="/home/ccoracle/Downloads/"
    local local_path="/Users/ccoracle/Downloads"

    if ssh "${remote_host}" test -f "${remote_path}${remote_file}"; then
        scp "${remote_host}:${remote_path}${remote_file}" "${local_path}"
        echo "File ${remote_file} copied from ${remote_host}:${remote_path} to ${local_path}"
    else
        echo "Error: File ${remote_file} does not exist on remote host."
    fi
}

##############################################################################################
# python setting
##############################################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ccoracle/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ccoracle/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ccoracle/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ccoracle/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

##############################################################################################
# Option
##############################################################################################
#setopt nosharehistory

##############################################################################################
# Exports
##############################################################################################
export LESS="eFRX"
export PATH=$HOME/.toolbox/bin:$PATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8.0)
#export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
if ! jenv plugins | grep -q export; then
        jenv enable-plugin export
fi
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$JAVA_HOME/bin:$PATH
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

