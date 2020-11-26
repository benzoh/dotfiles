set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
set -x PATH $HOME/.anyenv/envs/nodenv/bin $HOME/.anyenv/envs/nodenv/versions/12.16.1/bin $PATH
set -gx PATH $NODENV_ROOT/shims $PATH

set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $PATH $ANDROID_HOME/emulator
set -x PATH $PATH $ANDROID_HOME/tools
set -x PATH $PATH $ANDROID_HOME/tools/bin
set -x PATH $PATH $ANDROID_HOME/platform-tools

alias g='git'
