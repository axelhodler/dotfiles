if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t home || tmuxinator start home
fi
