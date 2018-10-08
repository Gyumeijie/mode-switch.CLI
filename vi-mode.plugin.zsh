# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}C%{$fg[red]%}ommand%{$reset_color%}"
fi

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}

# define right prompt, if it wasn't defined by a theme
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi

# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  # redraw the prompt
  zle -R
}

# Ensure that the prompt is redrawn when the terminal size changes.
TRAPWINCH() {
  zle && { zle -R; zle reset-prompt }
}

# Show information
zle -N zle-keymap-select
zle -N edit-command-line


# bindkey -v

# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
# bindkey -M vicmd 'v' edit-command-line

# define widget function
function zle-toggle-mode(){
   local mode=$(set -o | grep "^vi *off$")
   if [ "$mode" = "" ]; then
      # exit vi mode
      set +o vi
      # refresh ~/.zshrc to make real off-vi mode
      source ~/.zshrc
   else
      # enter vi mode
      set -o vi
      # every time we enter into vi mode, we should rebind the key 
      bindkey '^[t' zle-toggle-mode
   fi
   zle-keymap-select
}

# create widget from function
zle -N zle-toggle-mode
# bind widget to Alt + t
bindkey '^[t' zle-toggle-mode

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
