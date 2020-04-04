function toot(){
  sh /Users/Benzoh/App/toot_client/toot.sh $1;
}

function ide() {
  tmux split-window -v -p 40
  tmux split-window -h -p 66
  tmux split-window -h -p 50
}

function editHosts() {
  sudo nano /private/etc/hosts
}

function do-start() {
  docker stop $(docker ps -q)
  docker-compose start
  docker-compose ps
}