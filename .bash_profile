source ~/.bashrc

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
# 改行あり
# export PS1='\u@\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\n\[\033[00m\]\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[36m\]$(__git_ps1 [%s])\[\033[00m\]\n\$ '
# 改行なし
# export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

export PATH=$PATH:/usr/local/opt/dart/libexec:/Users/Benzoh/App/flutter/bin

# # 初回シェル時のみ tmux実行
# if [ $SHLVL = 1 ]; then
#   tmux
# fi