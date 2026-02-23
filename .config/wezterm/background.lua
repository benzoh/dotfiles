-- 背景画像のパスを設定
local background_image = "/Users/benzoh/.config/wezterm/wp1987761.jpg"

return {
    {
        source = {
            Gradient = {
                colors = { "#081d35", "#001522" }, -- グラデーションのカラーセット
                orientation = {
                    Linear = { angle = -30.0 }, -- グラデーションの方向と角度
                },
            },
        },
        opacity = 0.65, -- 透明度
        -- opacity = 1.0, -- 透明度
        width = "100%", -- 幅
        height = "100%", -- 高さ
    },
    {
        source = { File = background_image },
        opacity = 0.2, -- 透明度
        vertical_align = "Middle", -- 垂直方向の画像位置
        horizontal_align = "Right", -- 水平方向の画像位置
        horizontal_offset = "400px", -- 水平方向のオフセット
        repeat_x = "NoRepeat", -- 画像をx方向に繰り返すか
        repeat_y = "NoRepeat", -- 画像をy方向に繰り返すか
        -- width = "1431px", -- 画像の幅 (%指定も可能)
        -- height = "1900px", -- 画像の高さ (%指定も可能)
    },
}
