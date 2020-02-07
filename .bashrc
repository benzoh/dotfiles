function toot(){
  sh /Users/Benzoh/App/toot_client/toot.sh $1;
}

function ide() {
  tmux split-window -v -p 40
  tmux split-window -h -p 66
  tmux split-window -h -p 50
}

function editHosts() {
  sudo code /private/etc/hosts
}