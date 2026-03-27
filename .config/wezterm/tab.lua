local wezterm = require 'wezterm'

local M = {}

function M.apply_to_config(config)
  config.hide_tab_bar_if_only_one_tab = true
  config.show_new_tab_button_in_tab_bar = false
  -- nightlyのみ使用可能
  -- タブの閉じるボタンを非表示
  config.show_close_tab_button_in_tabs = false
  config.colors = {
    tab_bar = {
      inactive_tab_edge = "none",
    },
  }
end

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#4a3a6e"
  local foreground = "#dbd2d2"
  local edge_background = "none"
  if tab.is_active then
    background = "#7b3fe4"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return M
