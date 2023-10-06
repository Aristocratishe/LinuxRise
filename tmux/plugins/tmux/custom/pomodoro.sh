show_pomodoro() {
  tmux set-option -g @pomodoro_toggle 'p'                    # Start/pause a Pomodoro/break
  tmux set-option -g @pomodoro_cancel 'P'                    # Cancel the current session
  tmux set-option -g @pomodoro_skip '_'                      # Skip a Pomodoro/break

  tmux set-option -g @pomodoro_mins 25                       # The duration of the Pomodoro
  tmux set-option -g @pomodoro_break_mins 5                  # The duration of the break after the Pomodoro completes
  tmux set-option -g @pomodoro_intervals 4                   # The number of intervals before a longer break is started
  tmux set-option -g @pomodoro_long_break_mins 25            # The duration of the long break
  tmux set-option -g @pomodoro_repeat 'off'                  # Automatically repeat the Pomodoros?

  tmux set-option -g @pomodoro_on "  " #                    # The formatted output when the Pomodoro is running (, 🍅)
  tmux set-option -g @pomodoro_complete " ✔︎ "                # The formatted output when the break is running
  tmux set-option -g @pomodoro_pause " 󰏤 "                   # The formatted output when the Pomodoro/break is paused (⏸︎ )
  tmux set-option -g @pomodoro_prompt_break "  break?"      # The formatted output when waiting to start a break (⏲︎ )
  tmux set-option -g @pomodoro_prompt_pomodoro "  start?"   # The formatted output when waiting to start a Pomodoro (⏱︎ )
  
  tmux set-option -g @pomodoro_menu_position "R"             # The location of the menu relative to the screen
  tmux set-option -g @pomodoro_sound 'off'                   # Sound for desktop notifications (Run `ls /System/Library/Sounds` for a list of sounds to use on Mac)
  tmux set-option -g @pomodoro_notifications 'off'           # Enable desktop notifications from your terminal
  tmux set-option -g @pomodoro_granularity 'off'             # Enables MM:SS (ex: 00:10) format instead of the default (ex: 1m)
   
  # tmux set-option -g @pomodoro_on "#[fg=$text_red]🍅 "
  # tmux set-option -g @pomodoro_complete "#[fg=$text_green]🍅 "
  # tmux set-option -g @pomodoro_pause "#[fg=$color_yellow]🍅 "
  # tmux set-option -g @pomodoro_prompt_break "#[fg=$color_green]🕤 ? "
  # tmux set-option -g @pomodoro_prompt_pomodoro "#[fg=$color_gray]🕤 ? "
  
  tmux set-option -g @pomodoro_granularity 'on'

  local index=$1
  local icon=""
  local color=""
  local text=$(get_tmux_option "@catppuccin_pomodoro_text" "#{pomodoro_status}")

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
