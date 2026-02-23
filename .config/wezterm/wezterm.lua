-- @see https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization

local wezterm = require 'wezterm'
local background = require 'background'

local config = wezterm.config_builder()

config.background = background

config.font = wezterm.font("Source Han Code JP")
config.font_size = 10.5

config.automatically_reload_config = true
config.use_ime = true
config.window_background_opacity = 0.333
config.macos_window_background_blur = 10
-- ウィンドウの装飾をリサイズバーのみに設定（ヘッダー消す）
-- config.window_decorations = "RESIZE"
config.window_decorations = "TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR"
config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#111111" },
}
config.show_new_tab_button_in_tab_bar = false
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}
-- 文字色
config.color_schemes = {
  ['Custom Scheme'] = {
    foreground = '#ffffff',
    background = '#062e35',
  },
}
config.color_scheme = 'Custom Scheme'

-- ウィンドウサイズの初期値を設定
config.initial_rows = 55
config.initial_cols = 200

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#424063"
  local foreground = "#dbd2d2"
  local edge_background = "none"
  if tab.is_active then
    background = "#293fed"
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

-- @see https://zenn.dev/glaucus03/articles/070589323cb450

-- システムベル音を有効化（Claude Codeのタスク完了通知用）
config.audible_bell = "SystemBeep"

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

config.disable_default_key_bindings = true

-- keybinds.luaのキーバインディングにShift+Enterを追加
local keys = require("keybinds").keys
table.insert(keys, {
  key = 'Enter',
  mods = 'SHIFT',
  action = wezterm.action.SendString('\n')
})
config.keys = keys
config.key_tables = require("keybinds").key_tables

return config
