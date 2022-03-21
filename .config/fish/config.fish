set -x NODENV_ROOT $HOME/.anyenv/envs/nodenv
set -x PATH $HOME/.anyenv/envs/nodenv/bin $HOME/.anyenv/envs/nodenv/versions/12.16.1/bin $HOME/.anyenv/envs/nodenv/versions/14.17.1/bin $PATH
set -gx PATH $NODENV_ROOT/shims $PATH
#set -gx DOCKER_HOST tcp://127.0.0.1:2375
set -gx DOCKER_HOST unix:///Users/hippohack/.lima/docker/sock/docker.sock
set -gx LIMA_INSTANCE docker

alias g='git'
alias d='docker'
alias dc='docker-compose'

abbr -a -g g git
abbr -a -g limastart limactl start docker
abbr -a -g limastop limactl stop docker

status --is-interactive; and source (jump shell fish | psub)

# direnv
direnv hook fish | source