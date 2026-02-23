if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --- path

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# --- alias

alias g='git'
alias d='docker'
alias dc='docker-compose'

abbr -a -g g git
