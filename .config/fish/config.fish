# set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
# set -x PATH $HOME/.anyenv/envs/rbenv/bin $HOME/.anyenv/envs/nodenv/bin $HOME/.anyenv/envs/nodenv/versions/12.16.1/bin $HOME/.anyenv/envs/nodenv/versions/14.17.1/bin $PATH
# set -gx PATH $HOME/.rbenv/shims $NODENV_ROOT/shims $PATH
# status --is-interactive; and source (rbenv init -|psub)

# php8.0
# set -gx PATH /opt/homebrew/opt/php@8.0/bin $PATH
# set -gx LDFLAGS "-L/opt/homebrew/opt/php@8.0/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/php@8.0/include"

# php8.1
# set -gx PATH /opt/homebrew/opt/php@8.1/bin $PATH
# set -gx LDFLAGS "-L/opt/homebrew/opt/php@8.1/lib"
# set -gx CPPFLAGS "-I/opt/homebrew/opt/php@8.1/include"

# php8.2
set -gx PATH /opt/homebrew/Cellar/php/8.2.6/bin $PATH

alias g='git'
alias d='docker'
alias dc='docker-compose'

abbr -a -g g git

status --is-interactive; and source (jump shell fish | psub)

# direnv
direnv hook fish | source
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# # openssl
# set -gx PATH /opt/homebrew/opt/openssl@3/bin $PATH

# # openssl version 変更
# # @see https://zenn.dev/kosuke_ito/articles/0d508035bcd570
# set -x LIBRARY_PATH /opt/homebrew/Cellar/zstd/1.5.2/lib /opt/homebrew/Cellar/openssl@3/3.0.5/lib/

# NOTE: brew で入れれない問題があったので直でおいてる
set -gx PATH $HOME/lib/dart-sass $PATH

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
pyenv init - | source

# GOPATH
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
