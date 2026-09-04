local wezterm = require 'wezterm'

return {
    -- =========================
    -- FONT
    -- =========================

    font = wezterm.font("JetBrains Mono"),
    font_size = 11.5,

    -- =========================
    -- WINDOW
    -- =========================

    window_background_opacity = 0.60,

    window_padding = {
        left = 14,
        right = 14,
        top = 12,
        bottom = 12,
    },

    -- No tabs
    enable_tab_bar = false,

    -- No "Are you sure?" when closing
    window_close_confirmation = "NeverPrompt",

    -- Keep normal window borders
    window_decorations = "RESIZE",

    -- =========================
    -- COLORS
    -- Gruvbox Dark × Icy Blue
    -- =========================

    colors = {
        background = "#1D2021",
        foreground = "#DDEBF0",

        -- Cursor
        cursor_bg = "#83C5E5",
        cursor_fg = "#1D2021",
        cursor_border = "#83C5E5",

        -- Selection
        selection_bg = "#354A56",
        selection_fg = "#E8F4F7",

        -- Normal colors
        ansi = {
            "#282828", -- black
            "#CC666D", -- red
            "#8FB58A", -- green
            "#D2B56F", -- yellow
            "#4D9FCC", -- blue
            "#9A88BA", -- purple
            "#6EC4CC", -- cyan
            "#D5C4A1", -- white
        },

        -- Bright colors
        brights = {
            "#504945", -- bright black
            "#E57D84", -- bright red
            "#A8CF9F", -- bright green
            "#E5CB82", -- bright yellow
            "#7BC5EF", -- icy blue
            "#B4A2D4", -- bright purple
            "#91E0E5", -- icy cyan
            "#EBDBB2", -- bright white
        },
    },

    -- =========================
    -- CURSOR
    -- =========================

    default_cursor_style = "BlinkingBar",
    cursor_blink_rate = 650,

    -- =========================
    -- SCROLLBACK
    -- =========================

    scrollback_lines = 5000,

    -- =========================
    -- MOUSE
    -- Right click = paste
    -- =========================

    mouse_bindings = {
        {
            event = {
                Down = {
                    streak = 1,
                    button = "Right",
                },
            },
            mods = "NONE",
            action = wezterm.action.PasteFrom("Clipboard"),
        },
    },
}
