-- @see https://zenn.dev/mozumasu/articles/mozumasu-wezterm-customization

local wezterm = require 'wezterm'
local background = require 'background'
local tab = require 'tab'

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
config.window_frame = {
  inactive_titlebar_bg = "none",
  active_titlebar_bg = "none",
}
config.window_background_gradient = {
  colors = { "#111111" },
}
tab.apply_to_config(config)
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

-- Claude Codeの通知を受け取る

-- @see https://zenn.dev/choplin/articles/cb16c2da711de8#%E8%A7%A3%E6%B1%BA%E6%96%B9%E6%B3%95
wezterm.on('bell', function(window, pane)
  window:toast_notification('Claude Code', 'Task completed', nil, 4000)
end)

-- @see https://zenn.dev/glaucus03/articles/070589323cb450
-- システムベル音を有効化
config.audible_bell = "SystemBeep"

----------------------------------------------------
-- keybinds
----------------------------------------------------
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }

config.disable_default_key_bindings = true

local keybinds = require("keybinds")
config.keys = keybinds.keys
config.key_tables = keybinds.key_tables

return config
