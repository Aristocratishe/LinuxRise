show_host() {
  local index=$1
  local icon=$(get_tmux_option "@catppuccin_host_icon" "󰒋")
  local color=$(get_tmux_option "@catppuccin_host_color" "$thm_magenta")
  local ip_address=$(ip addr | grep -e 'state UP' -A 2 | awk '/inet /{printf $2}')
  local text=$(get_tmux_option "@catppuccin_host_text" "$ip_address") # or "$#H@ip_address"

  local module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
