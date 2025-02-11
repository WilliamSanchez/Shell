#!/bin/bash

SESSIONNAME="niid"
STARTDIR=${pwd}
tmux has-session -t apr &> /dev/null

if [ $? != 0 ]
  then
    tmux new-session -s $SESSIONNAME -c $STARTDIR/TCM -n "jptr" -d
    tmux send-keys -t $SESSIONNAME:0 "source activate TCM" C-m
    tmux send-keys -t $SESSIONNAME:0 "ls" C-m
    tmux split-window -t $SESSIONNAME:0 -v -c $STARTDIR/TCM
    tmux send-keys -t $SESSIONNAME:0 "source activate TCM" C-m
    tmux new-window -t $SESSIONNAME:1 -n "vitals" "htop"
    tmux split-window -t $SESSIONNAME:1 -v "watch -n 2 nvidia-smi"
    tmux new-window -t $SESSIONNAME:2 -n "KISHOW" -c $STARTDIR/kishow
    tmux send-keys -t $SESSIONNAME:2 "ls -lh" C-m
    tmux split-window -t $SESSIONNAME:2 -v -c $STARTDIR/kishow
    tmux send-keys -t $SESSIONNAME:2 "source activate kishow" C-m
    tmux split-window -t $SESSIONNAME:2 -v -c $STARTDIR/kishow
    tmux send-keys -t $SESSIONNAME:2 "source activate kishow" C-m
fi
tmux select-window -t $SESSIONNAME:0
tmux attach -t $SESSIONNAME
