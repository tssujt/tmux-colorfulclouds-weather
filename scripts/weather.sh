#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/helpers.sh"

get_weather() {
  local location=$(get_tmux_option "@tmux-weather-geo-location")
  local token=$(get_tmux_option "@tmux-weather-token")

  local response=$(curl -s "https://api.caiyunapp.com/v2.6/$token/$location/realtime.json")

  local temperature=$(echo "$response" | jq -r '.result.realtime.temperature')
  local air_quality=$(echo "$response" | jq -r '.result.realtime.air_quality.description.chn')

  echo "$temperature""°C 空气$air_quality"
}

main() {
  local update_interval=$((60 * $(get_tmux_option "@tmux-weather-interval" 15)))
  local current_time=$(date "+%s")
  local previous_update=$(get_tmux_option "@weather-previous-update-time")
  local delta=$((current_time - previous_update))

  if [ -z "$previous_update" ] || [ $delta -ge $update_interval ]; then
    local value=$(get_weather)
    if [ "$?" -eq 0 ]; then
      $(set_tmux_option "@weather-previous-update-time" "$current_time")
      $(set_tmux_option "@weather-previous-value" "$value")
    fi
  fi

  echo -n $(get_tmux_option "@weather-previous-value")
}

main
