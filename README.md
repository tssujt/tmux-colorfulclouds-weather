# ColorfulClouds Weather plugin for tmux
[![GitHub](https://img.shields.io/github/license/tssujt/tmux-colorfulclouds-weather)](https://opensource.org/licenses/MIT)

Shows weather in the status line, data provided by [ColorfulClouds](https://caiyunapp.com/)

## Installation
### Requirements
* curl
* jq

### With Tmux Plugin Manager
Add the plugin in `.tmux.conf`:
```
set -g @plugin 'tssujt/tmux-colorfulclouds-weather'
```
Press `prefix + I` to fetch the plugin and source it. Done.

### Manual
Clone the repo somewhere. Add `run-shell` in the end of `.tmux.conf`:

```
run-shell PATH_TO_REPO/tmux-colorfulclouds-weather.tmux
```
NOTE: this line should be placed after `set-option -g status-right ...`.

Press `prefix + :` and type `source-file ~/.tmux.conf`. Done.

## Usage
Add `#{weather}` somewhere in the right status line:
```
set-option -g status-right "#{weather}"
```
then you will see the current weather in the status line: `⛅️ -1°C`

## Customization
The plugin could be customized with:
* `set-option -g @tmux-weather-interval 15` - Set up the update interval in minutes, by default it is 15 minutes.
* `set-option -g @tmux-weather-geo-location "30,120"` - Set up your location.
* `set-option -g @tmux-weather-token "yourtoken"` - Set up your ColorfulClouds weather API token.

## License
tmux-colorfulclouds-weather plugin is released under the [MIT License](https://opensource.org/licenses/MIT).
