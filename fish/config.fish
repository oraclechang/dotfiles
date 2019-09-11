export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="/usr/local/opt/llvm/bin:$PATH"

export LC_ALL="en_US.UTF-8"
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
#set -g fish_user_paths "/Users/chuho/Library/Python/3.7/bin" $fish_user_paths
set -g fish_user_paths "$HOME/Library/Python/3.7/bin" $fish_user_paths
set -g fish_user_paths "$HOME/.gem/ruby/2.3.0/bin" $fish_user_paths
#set -g fish_user_paths "/Library/Developer/CommandLineTools/usr/bin" $fish_user_paths
#set -g fish_user_paths "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin" $fish_user_paths

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
