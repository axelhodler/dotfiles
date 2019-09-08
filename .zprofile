if [[ "$TERM" != "screen-256color" ]]
then
  tmux attach-session -t home || tmuxinator start home
fi

export LC_ALL=en_US.UTF-8
