-- ///////////////////////////////////////////////
-- //         Flux - Roblox UI Library        //
-- //         By you. Named by you. 🔥         //
-- ///////////////////////////////////////////////

local Flux = {}
Flux.__index = Flux

-- ─────────────────────────────────────────────
--  SERVICES
-- ─────────────────────────────────────────────
local Players         = game:GetService("Players")
local TweenService    = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService      = game:GetService("RunService")
local HttpService     = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer
local Mouse       = LocalPlayer:GetMouse()

-- ─────────────────────────────────────────────
--  BUILT-IN THEMES
-- ─────────────────────────────────────────────
Flux.Themes = {
    Dark = {
        Background   = Color3.fromRGB(18, 18, 22),
        Surface      = Color3.fromRGB(26, 26, 32),
        Border       = Color3.fromRGB(50, 50, 60),
        Accent       = Color3.fromRGB(99, 102, 241),
        AccentHover  = Color3.fromRGB(129, 132, 255),
        Text         = Color3.fromRGB(240, 240, 255),
        SubText      = Color3.fromRGB(140, 140, 160),
        Toggle_On    = Color3.fromRGB(99, 102, 241),
        Toggle_Off   = Color3.fromRGB(55, 55, 70),
        Slider_Fill  = Color3.fromRGB(99, 102, 241),
        Notification = Color3.fromRGB(30, 30, 38),
        TitleBar     = Color3.fromRGB(22, 22, 28),
    },
    Light = {
        Background   = Color3.fromRGB(245, 245, 250),
        Surface      = Color3.fromRGB(255, 255, 255),
        Border       = Color3.fromRGB(210, 210, 220),
        Accent       = Color3.fromRGB(79, 70, 229),
        AccentHover  = Color3.fromRGB(99, 90, 255),
        Text         = Color3.fromRGB(20, 20, 30),
        SubText      = Color3.fromRGB(100, 100, 120),
        Toggle_On    = Color3.fromRGB(79, 70, 229),
        Toggle_Off   = Color3.fromRGB(200, 200, 215),
        Slider_Fill  = Color3.fromRGB(79, 70, 229),
        Notification = Color3.fromRGB(255, 255, 255),
        TitleBar     = Color3.fromRGB(235, 235, 245),
    },
    Neon = {
        Background   = Color3.fromRGB(5, 5, 10),
        Surface      = Color3.fromRGB(10, 10, 20),
        Border       = Color3.fromRGB(0, 255, 180),
        Accent       = Color3.fromRGB(0, 255, 180),
        AccentHover  = Color3.fromRGB(0, 220, 150),
        Text         = Color3.fromRGB(0, 255, 180),
        SubText      = Color3.fromRGB(0, 180, 130),
        Toggle_On    = Color3.fromRGB(0, 255, 180),
        Toggle_Off   = Color3.fromRGB(20, 40, 35),
        Slider_Fill  = Color3.fromRGB(0, 255, 180),
        Notification = Color3.fromRGB(8, 8, 18),
        TitleBar     = Color3.fromRGB(8, 8, 16),
    },
    Rose = {
        Background   = Color3.fromRGB(20, 10, 15),
        Surface      = Color3.fromRGB(30, 15, 22),
        Border       = Color3.fromRGB(244, 63, 94),
        Accent       = Color3.fromRGB(244, 63, 94),
        AccentHover  = Color3.fromRGB(255, 90, 115),
        Text         = Color3.fromRGB(255, 220, 228),
        SubText      = Color3.fromRGB(200, 140, 155),
        Toggle_On    = Color3.fromRGB(244, 63, 94),
        Toggle_Off   = Color3.fromRGB(60, 30, 40),
        Slider_Fill  = Color3.fromRGB(244, 63, 94),
        Notification = Color3.fromRGB(28, 12, 18),
        TitleBar     = Color3.fromRGB(24, 10, 16),
    },
    Midnight = {
        Background   = Color3.fromRGB(8, 8, 20),
        Surface      = Color3.fromRGB(14, 14, 32),
        Border       = Color3.fromRGB(60, 60, 120),
        Accent       = Color3.fromRGB(100, 160, 255),
        AccentHover  = Color3.fromRGB(130, 185, 255),
        Text         = Color3.fromRGB(200, 215, 255),
        SubText      = Color3.fromRGB(120, 135, 180),
        Toggle_On    = Color3.fromRGB(100, 160, 255),
        Toggle_Off   = Color3.fromRGB(30, 30, 70),
        Slider_Fill  = Color3.fromRGB(100, 160, 255),
        Notification = Color3.fromRGB(10, 10, 24),
        TitleBar     = Color3.fromRGB(10, 10, 24),
    },
    Ocean = {
        Background   = Color3.fromRGB(5, 20, 35),
        Surface      = Color3.fromRGB(8, 30, 52),
        Border       = Color3.fromRGB(0, 180, 220),
        Accent       = Color3.fromRGB(0, 200, 240),
        AccentHover  = Color3.fromRGB(0, 220, 255),
        Text         = Color3.fromRGB(180, 240, 255),
        SubText      = Color3.fromRGB(100, 180, 210),
        Toggle_On    = Color3.fromRGB(0, 200, 240),
        Toggle_Off   = Color3.fromRGB(10, 50, 70),
        Slider_Fill  = Color3.fromRGB(0, 200, 240),
        Notification = Color3.fromRGB(6, 22, 38),
        TitleBar     = Color3.fromRGB(6, 22, 38),
    },
    Blood = {
        Background   = Color3.fromRGB(15, 5, 5),
        Surface      = Color3.fromRGB(25, 8, 8),
        Border       = Color3.fromRGB(180, 20, 20),
        Accent       = Color3.fromRGB(220, 30, 30),
        AccentHover  = Color3.fromRGB(255, 50, 50),
        Text         = Color3.fromRGB(255, 200, 200),
        SubText      = Color3.fromRGB(180, 100, 100),
        Toggle_On    = Color3.fromRGB(220, 30, 30),
        Toggle_Off   = Color3.fromRGB(60, 15, 15),
        Slider_Fill  = Color3.fromRGB(220, 30, 30),
        Notification = Color3.fromRGB(18, 6, 6),
        TitleBar     = Color3.fromRGB(18, 6, 6),
    },
    Gold = {
        Background   = Color3.fromRGB(15, 12, 5),
        Surface      = Color3.fromRGB(25, 20, 8),
        Border       = Color3.fromRGB(200, 160, 40),
        Accent       = Color3.fromRGB(240, 190, 50),
        AccentHover  = Color3.fromRGB(255, 210, 80),
        Text         = Color3.fromRGB(255, 235, 180),
        SubText      = Color3.fromRGB(180, 150, 80),
        Toggle_On    = Color3.fromRGB(240, 190, 50),
        Toggle_Off   = Color3.fromRGB(55, 42, 10),
        Slider_Fill  = Color3.fromRGB(240, 190, 50),
        Notification = Color3.fromRGB(18, 14, 5),
        TitleBar     = Color3.fromRGB(18, 14, 5),
    },
    Pastel = {
        Background   = Color3.fromRGB(240, 235, 255),
        Surface      = Color3.fromRGB(255, 250, 255),
        Border       = Color3.fromRGB(200, 185, 230),
        Accent       = Color3.fromRGB(180, 140, 220),
        AccentHover  = Color3.fromRGB(200, 160, 240),
        Text         = Color3.fromRGB(60, 40, 80),
        SubText      = Color3.fromRGB(140, 120, 160),
        Toggle_On    = Color3.fromRGB(180, 140, 220),
        Toggle_Off   = Color3.fromRGB(210, 200, 230),
        Slider_Fill  = Color3.fromRGB(180, 140, 220),
        Notification = Color3.fromRGB(245, 240, 255),
        TitleBar     = Color3.fromRGB(230, 222, 248),
    },
    Retro = {
        Background   = Color3.fromRGB(20, 15, 8),
        Surface      = Color3.fromRGB(32, 24, 12),
        Border       = Color3.fromRGB(200, 140, 40),
        Accent       = Color3.fromRGB(230, 160, 50),
        AccentHover  = Color3.fromRGB(255, 180, 70),
        Text         = Color3.fromRGB(240, 210, 140),
        SubText      = Color3.fromRGB(160, 130, 70),
        Toggle_On    = Color3.fromRGB(230, 160, 50),
        Toggle_Off   = Color3.fromRGB(55, 40, 15),
        Slider_Fill  = Color3.fromRGB(230, 160, 50),
        Notification = Color3.fromRGB(24, 18, 8),
        TitleBar     = Color3.fromRGB(24, 18, 8),
    },
}

-- ─────────────────────────────────────────────
--  INTERNAL STATE
-- ─────────────────────────────────────────────
Flux._flags   = {}  -- saved config values
Flux._windows = {}  -- all open windows
Flux._shortcuts = {} -- floating shortcut circles
Flux._activeTheme = nil

-- ─────────────────────────────────────────────
--  UTILITY FUNCTIONS
-- ─────────────────────────────────────────────
local function tween(obj, props, t, style, dir)
    local info = TweenInfo.new(t or 0.2, style or Enum.EasingStyle.Quart, dir or Enum.EasingDirection.Out)
    TweenService:Create(obj, info, props):Play()
end

local function makeCorner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius or 8)
    c.Parent = parent
    return c
end

local function makeStroke(parent, color, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness or 1
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function makeDraggable(frame, handle)
    handle = handle or frame
    local dragging, dragStart, startPos
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMove then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

-- ─────────────────────────────────────────────
--  SCREEN GUI ROOT
-- ─────────────────────────────────────────────
local function getRoot()
    local existing = LocalPlayer.PlayerGui:FindFirstChild("Flux_Root")
    if existing then return existing end
    local sg = Instance.new("ScreenGui")
    sg.Name            = "Flux_Root"
    sg.ResetOnSpawn    = false
    sg.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
    sg.DisplayOrder    = 999
    sg.IgnoreGuiInset  = true
    sg.Parent          = LocalPlayer.PlayerGui
    return sg
end

-- ─────────────────────────────────────────────
--  NOTIFICATION SYSTEM
-- ─────────────────────────────────────────────
local notifContainer

local function getNotifContainer(root)
    if notifContainer and notifContainer.Parent then return notifContainer end
    local f = Instance.new("Frame")
    f.Name              = "NotifContainer"
    f.Size              = UDim2.new(0, 280, 1, 0)
    f.Position          = UDim2.new(1, -290, 0, 10)
    f.BackgroundTransparency = 1
    f.Parent            = root
    local layout = Instance.new("UIListLayout")
    layout.SortOrder    = Enum.SortOrder.LayoutOrder
    layout.Padding      = UDim.new(0, 8)
    layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
    layout.Parent       = f
    notifContainer = f
    return f
end

function Flux:Notify(options)
    options = options or {}
    local theme     = Flux._activeTheme or Flux.Themes.Dark
    local title     = options.Title    or "Notification"
    local desc      = options.Description or ""
    local duration  = options.Duration or 4
    local root      = getRoot()
    local container = getNotifContainer(root)

    local card = Instance.new("Frame")
    card.Size               = UDim2.new(1, 0, 0, 70)
    card.BackgroundColor3   = theme.Notification
    card.BackgroundTransparency = 0.05
    card.BorderSizePixel    = 0
    card.ClipsDescendants   = true
    card.Parent             = container
    makeCorner(card, 10)
    makeStroke(card, theme.Accent, 1)

    -- accent bar left
    local bar = Instance.new("Frame")
    bar.Size              = UDim2.new(0, 3, 1, 0)
    bar.BackgroundColor3  = theme.Accent
    bar.BorderSizePixel   = 0
    bar.Parent            = card
    makeCorner(bar, 2)

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size               = UDim2.new(1, -20, 0, 20)
    titleLbl.Position           = UDim2.new(0, 14, 0, 10)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text               = title
    titleLbl.TextColor3         = theme.Text
    titleLbl.Font               = Enum.Font.GothamBold
    titleLbl.TextSize           = 14
    titleLbl.TextXAlignment     = Enum.TextXAlignment.Left
    titleLbl.Parent             = card

    local descLbl = Instance.new("TextLabel")
    descLbl.Size                = UDim2.new(1, -20, 0, 30)
    descLbl.Position            = UDim2.new(0, 14, 0, 32)
    descLbl.BackgroundTransparency = 1
    descLbl.Text                = desc
    descLbl.TextColor3          = theme.SubText
    descLbl.Font                = Enum.Font.Gotham
    descLbl.TextSize            = 12
    descLbl.TextXAlignment      = Enum.TextXAlignment.Left
    descLbl.TextWrapped         = true
    descLbl.Parent              = card

    -- progress bar
    local prog = Instance.new("Frame")
    prog.Size             = UDim2.new(1, 0, 0, 2)
    prog.Position         = UDim2.new(0, 0, 1, -2)
    prog.BackgroundColor3 = theme.Accent
    prog.BorderSizePixel  = 0
    prog.Parent           = card

    card.Position = UDim2.new(1, 10, 0, 0)
    tween(card, {Position = UDim2.new(0, 0, 0, 0)}, 0.3)
    tween(prog, {Size = UDim2.new(0, 0, 0, 2)}, duration, Enum.EasingStyle.Linear)

    task.delay(duration, function()
        tween(card, {Position = UDim2.new(1, 10, 0, 0)}, 0.3)
        task.wait(0.35)
        card:Destroy()
    end)
end

-- ─────────────────────────────────────────────
--  DIALOG / MODAL
-- ─────────────────────────────────────────────
function Flux:Dialog(options)
    options = options or {}
    local theme   = Flux._activeTheme or Flux.Themes.Dark
    local root    = getRoot()
    local title   = options.Title   or "Dialog"
    local desc    = options.Description or ""
    local buttons = options.Buttons or {{Title="OK", Callback=nil}}

    local overlay = Instance.new("Frame")
    overlay.Size                  = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundColor3      = Color3.fromRGB(0, 0, 0)
    overlay.BackgroundTransparency = 0.5
    overlay.BorderSizePixel       = 0
    overlay.ZIndex                = 200
    overlay.Parent                = root

    local card = Instance.new("Frame")
    card.Size               = UDim2.new(0, 320, 0, 160 + #buttons * 40)
    card.AnchorPoint        = Vector2.new(0.5, 0.5)
    card.Position           = UDim2.new(0.5, 0, 0.5, 0)
    card.BackgroundColor3   = theme.Surface
    card.BorderSizePixel    = 0
    card.ZIndex             = 201
    card.Parent             = overlay
    makeCorner(card, 12)
    makeStroke(card, theme.Border, 1)

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size               = UDim2.new(1, -20, 0, 30)
    titleLbl.Position           = UDim2.new(0, 10, 0, 14)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text               = title
    titleLbl.TextColor3         = theme.Text
    titleLbl.Font               = Enum.Font.GothamBold
    titleLbl.TextSize           = 16
    titleLbl.TextXAlignment     = Enum.TextXAlignment.Left
    titleLbl.ZIndex             = 202
    titleLbl.Parent             = card

    local descLbl = Instance.new("TextLabel")
    descLbl.Size                = UDim2.new(1, -20, 0, 60)
    descLbl.Position            = UDim2.new(0, 10, 0, 50)
    descLbl.BackgroundTransparency = 1
    descLbl.Text                = desc
    descLbl.TextColor3          = theme.SubText
    descLbl.Font                = Enum.Font.Gotham
    descLbl.TextSize            = 13
    descLbl.TextXAlignment      = Enum.TextXAlignment.Left
    descLbl.TextWrapped         = true
    descLbl.ZIndex              = 202
    descLbl.Parent              = card

    for i, btn in ipairs(buttons) do
        local b = Instance.new("TextButton")
        b.Size               = UDim2.new(1, -20, 0, 32)
        b.Position           = UDim2.new(0, 10, 0, 110 + (i-1) * 38)
        b.BackgroundColor3   = theme.Accent
        b.BorderSizePixel    = 0
        b.Text               = btn.Title or "OK"
        b.TextColor3         = Color3.fromRGB(255, 255, 255)
        b.Font               = Enum.Font.GothamBold
        b.TextSize           = 13
        b.ZIndex             = 202
        b.Parent             = card
        makeCorner(b, 8)
        b.MouseButton1Click:Connect(function()
            overlay:Destroy()
            if btn.Callback then btn.Callback() end
        end)
        b.MouseEnter:Connect(function()
            tween(b, {BackgroundColor3 = theme.AccentHover}, 0.15)
        end)
        b.MouseLeave:Connect(function()
            tween(b, {BackgroundColor3 = theme.Accent}, 0.15)
        end)
    end
end

-- ─────────────────────────────────────────────
--  SHORTCUT CIRCLES
-- ─────────────────────────────────────────────
local shortcutContainer

local function getShortcutContainer(root)
    if shortcutContainer and shortcutContainer.Parent then return shortcutContainer end
    local f = Instance.new("Frame")
    f.Name              = "ShortcutContainer"
    f.Size              = UDim2.new(0, 44, 1, -80)
    f.Position          = UDim2.new(0, 6, 0, 40)
    f.BackgroundTransparency = 1
    f.Parent            = root
    local layout = Instance.new("UIListLayout")
    layout.SortOrder    = Enum.SortOrder.LayoutOrder
    layout.Padding      = UDim.new(0, 6)
    layout.Parent       = f
    shortcutContainer = f
    return f
end

-- Creates a floating shortcut circle linked to a toggle state
-- options: { Title, Icon (text/emoji), Value (bool), Callback }
function Flux:AddShortcut(options)
    options = options or {}
    local theme    = Flux._activeTheme or Flux.Themes.Dark
    local root     = getRoot()
    local container = getShortcutContainer(root)
    local state    = options.Value or false
    local label    = options.Title or "?"
    local icon     = options.Icon or string.sub(label, 1, 1)

    local circle = Instance.new("TextButton")
    circle.Size             = UDim2.new(0, 38, 0, 38)
    circle.BackgroundColor3 = state and theme.Accent or theme.Surface
    circle.BorderSizePixel  = 0
    circle.Text             = icon
    circle.TextColor3       = theme.Text
    circle.Font             = Enum.Font.GothamBold
    circle.TextSize         = 14
    circle.Parent           = container
    makeCorner(circle, 19) -- full circle
    makeStroke(circle, state and theme.Accent or theme.Border, 1.5)

    -- tooltip
    local tooltip = Instance.new("TextLabel")
    tooltip.Size               = UDim2.new(0, 120, 0, 26)
    tooltip.Position           = UDim2.new(1, 6, 0.5, -13)
    tooltip.BackgroundColor3   = theme.Background
    tooltip.BorderSizePixel    = 0
    tooltip.Text               = label
    tooltip.TextColor3         = theme.Text
    tooltip.Font               = Enum.Font.Gotham
    tooltip.TextSize           = 12
    tooltip.Visible            = false
    tooltip.ZIndex             = 300
    tooltip.Parent             = circle
    makeCorner(tooltip, 6)
    makeStroke(tooltip, theme.Border, 1)

    local stroke = circle:FindFirstChildOfClass("UIStroke")

    circle.MouseEnter:Connect(function()
        tooltip.Visible = true
        tween(circle, {BackgroundColor3 = state and theme.AccentHover or theme.Border}, 0.15)
    end)
    circle.MouseLeave:Connect(function()
        tooltip.Visible = false
        tween(circle, {BackgroundColor3 = state and theme.Accent or theme.Surface}, 0.15)
    end)
    circle.MouseButton1Click:Connect(function()
        state = not state
        tween(circle, {BackgroundColor3 = state and theme.Accent or theme.Surface}, 0.2)
        if stroke then
            tween(stroke, {Color = state and theme.Accent or theme.Border}, 0.2)
        end
        if options.Callback then options.Callback(state) end
        if options.Flag then Flux._flags[options.Flag] = state end
    end)

    table.insert(Flux._shortcuts, {Circle = circle, GetState = function() return state end})
    return circle
end

-- ─────────────────────────────────────────────
--  CREATE WINDOW
-- ─────────────────────────────────────────────
function Flux:CreateWindow(options)
    options = options or {}
    local title     = options.Title  or "Flux"
    local themeName = options.Theme  or "Dark"
    local customTheme = options.CustomTheme
    local size      = options.Size   or UDim2.new(0, 520, 0, 380)
    local position  = options.Position or UDim2.new(0.5, -260, 0.5, -190)

    -- resolve theme
    local theme = customTheme or Flux.Themes[themeName] or Flux.Themes.Dark
    Flux._activeTheme = theme

    local root = getRoot()

    -- ── WINDOW FRAME ──────────────────────────
    local win = Instance.new("Frame")
    win.Name             = "Flux_Window_" .. title
    win.Size             = size
    win.Position         = position
    win.BackgroundColor3 = theme.Background
    win.BorderSizePixel  = 0
    win.ClipsDescendants = false
    win.Parent           = root
    makeCorner(win, 12)
    makeStroke(win, theme.Border, 1)

    -- ── TITLE BAR ─────────────────────────────
    local titleBar = Instance.new("Frame")
    titleBar.Name            = "TitleBar"
    titleBar.Size            = UDim2.new(1, 0, 0, 40)
    titleBar.BackgroundColor3 = theme.TitleBar
    titleBar.BorderSizePixel = 0
    titleBar.Parent          = win
    makeCorner(titleBar, 12)

    -- fix bottom corners of titlebar
    local titleBarFix = Instance.new("Frame")
    titleBarFix.Size              = UDim2.new(1, 0, 0, 10)
    titleBarFix.Position          = UDim2.new(0, 0, 1, -10)
    titleBarFix.BackgroundColor3  = theme.TitleBar
    titleBarFix.BorderSizePixel   = 0
    titleBarFix.Parent            = titleBar

    local titleLbl = Instance.new("TextLabel")
    titleLbl.Size               = UDim2.new(1, -100, 1, 0)
    titleLbl.Position           = UDim2.new(0, 14, 0, 0)
    titleLbl.BackgroundTransparency = 1
    titleLbl.Text               = title
    titleLbl.TextColor3         = theme.Text
    titleLbl.Font               = Enum.Font.GothamBold
    titleLbl.TextSize           = 15
    titleLbl.TextXAlignment     = Enum.TextXAlignment.Left
    titleLbl.Parent             = titleBar

    -- close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size             = UDim2.new(0, 28, 0, 28)
    closeBtn.Position         = UDim2.new(1, -34, 0.5, -14)
    closeBtn.BackgroundColor3 = Color3.fromRGB(220, 60, 60)
    closeBtn.Text             = "✕"
    closeBtn.TextColor3       = Color3.fromRGB(255,255,255)
    closeBtn.Font             = Enum.Font.GothamBold
    closeBtn.TextSize         = 13
    closeBtn.BorderSizePixel  = 0
    closeBtn.Parent           = titleBar
    makeCorner(closeBtn, 6)

    -- minimize button
    local minBtn = Instance.new("TextButton")
    minBtn.Size             = UDim2.new(0, 28, 0, 28)
    minBtn.Position         = UDim2.new(1, -66, 0.5, -14)
    minBtn.BackgroundColor3 = Color3.fromRGB(220, 160, 30)
    minBtn.Text             = "–"
    minBtn.TextColor3       = Color3.fromRGB(255,255,255)
    minBtn.Font             = Enum.Font.GothamBold
    minBtn.TextSize         = 14
    minBtn.BorderSizePixel  = 0
    minBtn.Parent           = titleBar
    makeCorner(minBtn, 6)

    local minimized = false
    local contentFrame -- defined later

    makeDraggable(win, titleBar)

    -- ── CONTENT AREA ─────────────────────────
    local content = Instance.new("Frame")
    content.Name             = "Content"
    content.Size             = UDim2.new(1, 0, 1, -40)
    content.Position         = UDim2.new(0, 0, 0, 40)
    content.BackgroundTransparency = 1
    content.ClipsDescendants = true
    content.Parent           = win
    contentFrame = content

    -- ── TAB BAR ───────────────────────────────
    local tabBar = Instance.new("Frame")
    tabBar.Name            = "TabBar"
    tabBar.Size            = UDim2.new(0, 110, 1, 0)
    tabBar.BackgroundColor3 = theme.Surface
    tabBar.BorderSizePixel = 0
    tabBar.Parent          = content
    makeStroke(tabBar, theme.Border, 1)

    local tabLayout = Instance.new("UIListLayout")
    tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
    tabLayout.Padding   = UDim.new(0, 4)
    tabLayout.Parent    = tabBar

    local tabPad = Instance.new("UIPadding")
    tabPad.PaddingTop  = UDim.new(0, 8)
    tabPad.PaddingLeft = UDim.new(0, 6)
    tabPad.PaddingRight = UDim.new(0, 6)
    tabPad.Parent      = tabBar

    -- ── TAB CONTENT AREA ──────────────────────
    local tabContent = Instance.new("Frame")
    tabContent.Name             = "TabContent"
    tabContent.Size             = UDim2.new(1, -110, 1, 0)
    tabContent.Position         = UDim2.new(0, 110, 0, 0)
    tabContent.BackgroundTransparency = 1
    tabContent.ClipsDescendants = true
    tabContent.Parent           = content

    local tabs = {}
    local activeTab = nil

    -- ── CLOSE / MINIMIZE ─────────────────────
    closeBtn.MouseButton1Click:Connect(function()
        tween(win, {Size = UDim2.new(0, win.AbsoluteSize.X, 0, 0)}, 0.2)
        task.wait(0.22)
        win:Destroy()
    end)

    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            tween(win, {Size = UDim2.new(0, win.AbsoluteSize.X, 0, 40)}, 0.2)
            content.Visible = false
        else
            content.Visible = true
            tween(win, {Size = size}, 0.2)
        end
    end)

    -- ─────────────────────────────────────────
    --  WINDOW OBJECT (returned to user)
    -- ─────────────────────────────────────────
    local Window = {}

    function Window:SetTheme(newThemeName, customColors)
        theme = customColors or Flux.Themes[newThemeName] or theme
        Flux._activeTheme = theme
        -- basic re-color of key frames
        win.BackgroundColor3  = theme.Background
        titleBar.BackgroundColor3 = theme.TitleBar
        titleBarFix.BackgroundColor3 = theme.TitleBar
        tabBar.BackgroundColor3 = theme.Surface
        titleLbl.TextColor3   = theme.Text
    end

    function Window:Tab(tabOptions)
        tabOptions = tabOptions or {}
        local tabTitle = tabOptions.Title or "Tab"
        local tabIcon  = tabOptions.Icon  or ""

        -- tab button
        local tabBtn = Instance.new("TextButton")
        tabBtn.Size             = UDim2.new(1, 0, 0, 34)
        tabBtn.BackgroundColor3 = theme.Surface
        tabBtn.BorderSizePixel  = 0
        tabBtn.Text             = (tabIcon ~= "" and tabIcon .. "  " or "") .. tabTitle
        tabBtn.TextColor3       = theme.SubText
        tabBtn.Font             = Enum.Font.Gotham
        tabBtn.TextSize         = 13
        tabBtn.TextXAlignment   = Enum.TextXAlignment.Left
        tabBtn.LayoutOrder      = #tabs + 1
        tabBtn.Parent           = tabBar
        makeCorner(tabBtn, 8)

        local tabPadding = Instance.new("UIPadding")
        tabPadding.PaddingLeft = UDim.new(0, 10)
        tabPadding.Parent      = tabBtn

        -- tab page (scrolling frame)
        local page = Instance.new("ScrollingFrame")
        page.Name                  = "Page_" .. tabTitle
        page.Size                  = UDim2.new(1, 0, 1, 0)
        page.BackgroundTransparency = 1
        page.BorderSizePixel       = 0
        page.ScrollBarThickness    = 3
        page.ScrollBarImageColor3  = theme.Accent
        page.Visible               = false
        page.CanvasSize            = UDim2.new(0, 0, 0, 0)
        page.AutomaticCanvasSize   = Enum.AutomaticSize.Y
        page.Parent                = tabContent

        local pageLayout = Instance.new("UIListLayout")
        pageLayout.SortOrder       = Enum.SortOrder.LayoutOrder
        pageLayout.Padding         = UDim.new(0, 6)
        pageLayout.Parent          = page

        local pagePad = Instance.new("UIPadding")
        pagePad.PaddingTop    = UDim.new(0, 10)
        pagePad.PaddingLeft   = UDim.new(0, 10)
        pagePad.PaddingRight  = UDim.new(0, 10)
        pagePad.PaddingBottom = UDim.new(0, 10)
        pagePad.Parent        = page

        local tabData = {Button = tabBtn, Page = page}
        table.insert(tabs, tabData)

        local function selectTab()
            for _, t in ipairs(tabs) do
                t.Page.Visible = false
                tween(t.Button, {BackgroundColor3 = theme.Surface, TextColor3 = theme.SubText}, 0.15)
            end
            page.Visible = true
            activeTab = tabData
            tween(tabBtn, {BackgroundColor3 = theme.Accent, TextColor3 = Color3.fromRGB(255,255,255)}, 0.15)
        end

        tabBtn.MouseButton1Click:Connect(selectTab)
        if #tabs == 1 then selectTab() end

        -- ── TAB ELEMENTS ──────────────────────
        local Tab = {}

        local function makeSection(sectionTitle)
            local sec = Instance.new("Frame")
            sec.Size              = UDim2.new(1, 0, 0, 28)
            sec.BackgroundTransparency = 1
            sec.AutomaticSize     = Enum.AutomaticSize.Y
            sec.LayoutOrder       = 0
            sec.Parent            = page

            local secLabel = Instance.new("TextLabel")
            secLabel.Size               = UDim2.new(1, 0, 0, 20)
            secLabel.BackgroundTransparency = 1
            secLabel.Text               = sectionTitle or ""
            secLabel.TextColor3         = theme.SubText
            secLabel.Font               = Enum.Font.GothamBold
            secLabel.TextSize           = 11
            secLabel.TextXAlignment     = Enum.TextXAlignment.Left
            secLabel.Parent             = sec

            local line = Instance.new("Frame")
            line.Size             = UDim2.new(1, 0, 0, 1)
            line.Position         = UDim2.new(0, 0, 0, 20)
            line.BackgroundColor3 = theme.Border
            line.BorderSizePixel  = 0
            line.Parent           = sec

            return sec
        end

        -- ── LABEL ─────────────────────────────
        function Tab:Label(opts)
            opts = opts or {}
            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(1, 0, 0, 22)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or ""
            lbl.TextColor3         = opts.Color or theme.SubText
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.TextWrapped        = true
            lbl.AutomaticSize      = Enum.AutomaticSize.Y
            lbl.LayoutOrder        = opts.LayoutOrder or 0
            lbl.Parent             = page
            return {Label = lbl, Set = function(_, txt) lbl.Text = txt end}
        end

        -- ── SECTION ───────────────────────────
        function Tab:Section(opts)
            opts = opts or {}
            makeSection(opts.Title or "Section")
        end

        -- ── BUTTON ────────────────────────────
        function Tab:Button(opts)
            opts = opts or {}
            local btn = Instance.new("TextButton")
            btn.Size             = UDim2.new(1, 0, 0, 36)
            btn.BackgroundColor3 = theme.Surface
            btn.BorderSizePixel  = 0
            btn.Text             = opts.Title or "Button"
            btn.TextColor3       = theme.Text
            btn.Font             = Enum.Font.GothamBold
            btn.TextSize         = 13
            btn.LayoutOrder      = opts.LayoutOrder or 0
            btn.Parent           = page
            makeCorner(btn, 8)
            makeStroke(btn, theme.Border, 1)

            btn.MouseEnter:Connect(function()
                tween(btn, {BackgroundColor3 = theme.Border}, 0.12)
            end)
            btn.MouseLeave:Connect(function()
                tween(btn, {BackgroundColor3 = theme.Surface}, 0.12)
            end)
            btn.MouseButton1Click:Connect(function()
                tween(btn, {BackgroundColor3 = theme.Accent}, 0.1)
                task.wait(0.1)
                tween(btn, {BackgroundColor3 = theme.Surface}, 0.15)
                if opts.Callback then opts.Callback() end
            end)
        end

        -- ── TOGGLE ────────────────────────────
        function Tab:Toggle(opts)
            opts = opts or {}
            local state = opts.Value or false
            if opts.Flag then
                state = Flux._flags[opts.Flag] ~= nil and Flux._flags[opts.Flag] or state
            end

            local row = Instance.new("Frame")
            row.Size             = UDim2.new(1, 0, 0, 36)
            row.BackgroundColor3 = theme.Surface
            row.BorderSizePixel  = 0
            row.LayoutOrder      = opts.LayoutOrder or 0
            row.Parent           = page
            makeCorner(row, 8)
            makeStroke(row, theme.Border, 1)

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(1, -60, 1, 0)
            lbl.Position           = UDim2.new(0, 12, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Toggle"
            lbl.TextColor3         = theme.Text
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = row

            local track = Instance.new("Frame")
            track.Size             = UDim2.new(0, 40, 0, 20)
            track.Position         = UDim2.new(1, -50, 0.5, -10)
            track.BackgroundColor3 = state and theme.Toggle_On or theme.Toggle_Off
            track.BorderSizePixel  = 0
            track.Parent           = row
            makeCorner(track, 10)

            local knob = Instance.new("Frame")
            knob.Size             = UDim2.new(0, 16, 0, 16)
            knob.Position         = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)
            knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            knob.BorderSizePixel  = 0
            knob.Parent           = track
            makeCorner(knob, 8)

            local function updateToggle()
                tween(track, {BackgroundColor3 = state and theme.Toggle_On or theme.Toggle_Off}, 0.15)
                tween(knob, {Position = state and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8)}, 0.15)
            end

            row.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    state = not state
                    updateToggle()
                    if opts.Flag then Flux._flags[opts.Flag] = state end
                    if opts.Callback then opts.Callback(state) end
                end
            end)

            updateToggle()
            return {GetState = function() return state end, Set = function(_, v)
                state = v
                updateToggle()
                if opts.Flag then Flux._flags[opts.Flag] = state end
            end}
        end

        -- ── SLIDER ────────────────────────────
        function Tab:Slider(opts)
            opts = opts or {}
            local min    = opts.Min     or 0
            local max    = opts.Max     or 100
            local step   = opts.Step    or 1
            local val    = opts.Value   or min
            if opts.Flag and Flux._flags[opts.Flag] then
                val = Flux._flags[opts.Flag]
            end

            local container = Instance.new("Frame")
            container.Size             = UDim2.new(1, 0, 0, 52)
            container.BackgroundColor3 = theme.Surface
            container.BorderSizePixel  = 0
            container.LayoutOrder      = opts.LayoutOrder or 0
            container.Parent           = page
            makeCorner(container, 8)
            makeStroke(container, theme.Border, 1)

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(0.7, 0, 0, 22)
            lbl.Position           = UDim2.new(0, 12, 0, 6)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Slider"
            lbl.TextColor3         = theme.Text
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = container

            local valLbl = Instance.new("TextLabel")
            valLbl.Size               = UDim2.new(0.3, -12, 0, 22)
            valLbl.Position           = UDim2.new(0.7, 0, 0, 6)
            valLbl.BackgroundTransparency = 1
            valLbl.Text               = tostring(val)
            valLbl.TextColor3         = theme.Accent
            valLbl.Font               = Enum.Font.GothamBold
            valLbl.TextSize           = 13
            valLbl.TextXAlignment     = Enum.TextXAlignment.Right
            valLbl.Parent             = container

            local track = Instance.new("Frame")
            track.Size             = UDim2.new(1, -24, 0, 6)
            track.Position         = UDim2.new(0, 12, 0, 36)
            track.BackgroundColor3 = theme.Toggle_Off
            track.BorderSizePixel  = 0
            track.Parent           = container
            makeCorner(track, 3)

            local fill = Instance.new("Frame")
            fill.Size             = UDim2.new((val - min) / (max - min), 0, 1, 0)
            fill.BackgroundColor3 = theme.Slider_Fill
            fill.BorderSizePixel  = 0
            fill.Parent           = track
            makeCorner(fill, 3)

            local dragging = false
            track.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMove then
                    local rel = (Mouse.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
                    rel = math.clamp(rel, 0, 1)
                    local raw = min + rel * (max - min)
                    val = math.round(raw / step) * step
                    val = math.clamp(val, min, max)
                    fill.Size = UDim2.new((val - min) / (max - min), 0, 1, 0)
                    valLbl.Text = tostring(val)
                    if opts.Flag then Flux._flags[opts.Flag] = val end
                    if opts.Callback then opts.Callback(val) end
                end
            end)

            return {GetValue = function() return val end}
        end

        -- ── DROPDOWN ──────────────────────────
        function Tab:Dropdown(opts)
            opts = opts or {}
            local items    = opts.Items or {}
            local selected = opts.Value or (items[1] or "Select...")
            local open     = false

            local container = Instance.new("Frame")
            container.Size             = UDim2.new(1, 0, 0, 36)
            container.BackgroundColor3 = theme.Surface
            container.BorderSizePixel  = 0
            container.ClipsDescendants = false
            container.LayoutOrder      = opts.LayoutOrder or 0
            container.Parent           = page
            makeCorner(container, 8)
            makeStroke(container, theme.Border, 1)

            local mainBtn = Instance.new("TextButton")
            mainBtn.Size             = UDim2.new(1, 0, 1, 0)
            mainBtn.BackgroundTransparency = 1
            mainBtn.Text             = ""
            mainBtn.Parent           = container

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(0.6, 0, 1, 0)
            lbl.Position           = UDim2.new(0, 12, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Dropdown"
            lbl.TextColor3         = theme.Text
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = container

            local selLbl = Instance.new("TextLabel")
            selLbl.Size               = UDim2.new(0.4, -30, 1, 0)
            selLbl.Position           = UDim2.new(0.6, 0, 0, 0)
            selLbl.BackgroundTransparency = 1
            selLbl.Text               = selected
            selLbl.TextColor3         = theme.Accent
            selLbl.Font               = Enum.Font.GothamBold
            selLbl.TextSize           = 12
            selLbl.TextXAlignment     = Enum.TextXAlignment.Right
            selLbl.Parent             = container

            local arrow = Instance.new("TextLabel")
            arrow.Size               = UDim2.new(0, 20, 1, 0)
            arrow.Position           = UDim2.new(1, -22, 0, 0)
            arrow.BackgroundTransparency = 1
            arrow.Text               = "▾"
            arrow.TextColor3         = theme.SubText
            arrow.Font               = Enum.Font.GothamBold
            arrow.TextSize           = 14
            arrow.Parent             = container

            local dropdown = Instance.new("Frame")
            dropdown.Size             = UDim2.new(1, 0, 0, #items * 30 + 6)
            dropdown.Position         = UDim2.new(0, 0, 1, 4)
            dropdown.BackgroundColor3 = theme.Surface
            dropdown.BorderSizePixel  = 0
            dropdown.Visible          = false
            dropdown.ZIndex           = 50
            dropdown.Parent           = container
            makeCorner(dropdown, 8)
            makeStroke(dropdown, theme.Border, 1)

            local ddLayout = Instance.new("UIListLayout")
            ddLayout.SortOrder = Enum.SortOrder.LayoutOrder
            ddLayout.Padding   = UDim.new(0, 2)
            ddLayout.Parent    = dropdown

            local ddPad = Instance.new("UIPadding")
            ddPad.PaddingTop = UDim.new(0, 3)
            ddPad.PaddingLeft = UDim.new(0, 4)
            ddPad.PaddingRight = UDim.new(0, 4)
            ddPad.Parent = dropdown

            for _, item in ipairs(items) do
                local itemBtn = Instance.new("TextButton")
                itemBtn.Size             = UDim2.new(1, 0, 0, 28)
                itemBtn.BackgroundColor3 = theme.Surface
                itemBtn.BorderSizePixel  = 0
                itemBtn.Text             = item
                itemBtn.TextColor3       = theme.Text
                itemBtn.Font             = Enum.Font.Gotham
                itemBtn.TextSize         = 12
                itemBtn.ZIndex           = 51
                itemBtn.Parent           = dropdown
                makeCorner(itemBtn, 6)

                itemBtn.MouseEnter:Connect(function()
                    tween(itemBtn, {BackgroundColor3 = theme.Accent}, 0.1)
                    tween(itemBtn, {TextColor3 = Color3.fromRGB(255,255,255)}, 0.1)
                end)
                itemBtn.MouseLeave:Connect(function()
                    tween(itemBtn, {BackgroundColor3 = theme.Surface}, 0.1)
                    tween(itemBtn, {TextColor3 = theme.Text}, 0.1)
                end)
                itemBtn.MouseButton1Click:Connect(function()
                    selected = item
                    selLbl.Text = item
                    dropdown.Visible = false
                    open = false
                    if opts.Flag then Flux._flags[opts.Flag] = selected end
                    if opts.Callback then opts.Callback(selected) end
                end)
            end

            mainBtn.MouseButton1Click:Connect(function()
                open = not open
                dropdown.Visible = open
                tween(arrow, {Rotation = open and 180 or 0}, 0.15)
            end)

            return {GetValue = function() return selected end}
        end

        -- ── TEXT INPUT ────────────────────────
        function Tab:Input(opts)
            opts = opts or {}
            local container = Instance.new("Frame")
            container.Size             = UDim2.new(1, 0, 0, 52)
            container.BackgroundColor3 = theme.Surface
            container.BorderSizePixel  = 0
            container.LayoutOrder      = opts.LayoutOrder or 0
            container.Parent           = page
            makeCorner(container, 8)
            makeStroke(container, theme.Border, 1)

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(1, -12, 0, 20)
            lbl.Position           = UDim2.new(0, 12, 0, 6)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Input"
            lbl.TextColor3         = theme.SubText
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 11
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = container

            local box = Instance.new("TextBox")
            box.Size               = UDim2.new(1, -24, 0, 22)
            box.Position           = UDim2.new(0, 12, 0, 24)
            box.BackgroundColor3   = theme.Background
            box.BorderSizePixel    = 0
            box.Text               = opts.Value or ""
            box.PlaceholderText    = opts.Placeholder or "Type here..."
            box.TextColor3         = theme.Text
            box.PlaceholderColor3  = theme.SubText
            box.Font               = Enum.Font.Gotham
            box.TextSize           = 13
            box.TextXAlignment     = Enum.TextXAlignment.Left
            box.ClearTextOnFocus   = opts.ClearOnFocus or false
            box.Parent             = container
            makeCorner(box, 6)

            box.FocusLost:Connect(function(enter)
                if opts.Callback then opts.Callback(box.Text, enter) end
                if opts.Flag then Flux._flags[opts.Flag] = box.Text end
            end)

            return {GetValue = function() return box.Text end, Set = function(_, v) box.Text = v end}
        end

        -- ── KEYBIND ───────────────────────────
        function Tab:Keybind(opts)
            opts = opts or {}
            local currentKey = opts.Value or Enum.KeyCode.Unknown
            local listening  = false

            local row = Instance.new("Frame")
            row.Size             = UDim2.new(1, 0, 0, 36)
            row.BackgroundColor3 = theme.Surface
            row.BorderSizePixel  = 0
            row.LayoutOrder      = opts.LayoutOrder or 0
            row.Parent           = page
            makeCorner(row, 8)
            makeStroke(row, theme.Border, 1)

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(0.6, 0, 1, 0)
            lbl.Position           = UDim2.new(0, 12, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Keybind"
            lbl.TextColor3         = theme.Text
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = row

            local keyBtn = Instance.new("TextButton")
            keyBtn.Size            = UDim2.new(0, 80, 0, 24)
            keyBtn.Position        = UDim2.new(1, -88, 0.5, -12)
            keyBtn.BackgroundColor3 = theme.Background
            keyBtn.BorderSizePixel = 0
            keyBtn.Text            = currentKey == Enum.KeyCode.Unknown and "None" or currentKey.Name
            keyBtn.TextColor3      = theme.Accent
            keyBtn.Font            = Enum.Font.GothamBold
            keyBtn.TextSize        = 12
            keyBtn.Parent          = row
            makeCorner(keyBtn, 6)

            keyBtn.MouseButton1Click:Connect(function()
                listening = true
                keyBtn.Text = "..."
                keyBtn.TextColor3 = theme.SubText
            end)

            UserInputService.InputBegan:Connect(function(input, processed)
                if listening and input.UserInputType == Enum.UserInputType.Keyboard then
                    currentKey = input.KeyCode
                    keyBtn.Text = currentKey.Name
                    keyBtn.TextColor3 = theme.Accent
                    listening = false
                    if opts.Callback then opts.Callback(currentKey) end
                    if opts.Flag then Flux._flags[opts.Flag] = currentKey end
                end
            end)

            return {GetValue = function() return currentKey end}
        end

        -- ── COLOR PICKER ──────────────────────
        function Tab:ColorPicker(opts)
            opts = opts or {}
            local currentColor = opts.Value or Color3.fromRGB(255, 255, 255)

            local container = Instance.new("Frame")
            container.Size             = UDim2.new(1, 0, 0, 36)
            container.BackgroundColor3 = theme.Surface
            container.BorderSizePixel  = 0
            container.LayoutOrder      = opts.LayoutOrder or 0
            container.Parent           = page
            makeCorner(container, 8)
            makeStroke(container, theme.Border, 1)

            local lbl = Instance.new("TextLabel")
            lbl.Size               = UDim2.new(0.7, 0, 1, 0)
            lbl.Position           = UDim2.new(0, 12, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Text               = opts.Title or "Color"
            lbl.TextColor3         = theme.Text
            lbl.Font               = Enum.Font.Gotham
            lbl.TextSize           = 13
            lbl.TextXAlignment     = Enum.TextXAlignment.Left
            lbl.Parent             = container

            local preview = Instance.new("Frame")
            preview.Size             = UDim2.new(0, 28, 0, 20)
            preview.Position         = UDim2.new(1, -36, 0.5, -10)
            preview.BackgroundColor3 = currentColor
            preview.BorderSizePixel  = 0
            preview.Parent           = container
            makeCorner(preview, 5)
            makeStroke(preview, theme.Border, 1)

            -- Simple R,G,B input popup
            local popupOpen = false
            local popup

            local clickDetect = Instance.new("TextButton")
            clickDetect.Size             = UDim2.new(1, 0, 1, 0)
            clickDetect.BackgroundTransparency = 1
            clickDetect.Text             = ""
            clickDetect.Parent           = container

            clickDetect.MouseButton1Click:Connect(function()
                popupOpen = not popupOpen
                if popup then popup:Destroy() popup = nil end
                if not popupOpen then return end

                popup = Instance.new("Frame")
                popup.Size             = UDim2.new(1, 0, 0, 110)
                popup.Position         = UDim2.new(0, 0, 1, 4)
                popup.BackgroundColor3 = theme.Surface
                popup.BorderSizePixel  = 0
                popup.ZIndex           = 60
                popup.Parent           = container
                makeCorner(popup, 8)
                makeStroke(popup, theme.Border, 1)

                local channels = {"R","G","B"}
                local values   = {currentColor.R*255, currentColor.G*255, currentColor.B*255}

                for i, ch in ipairs(channels) do
                    local row = Instance.new("Frame")
                    row.Size             = UDim2.new(1, -16, 0, 26)
                    row.Position         = UDim2.new(0, 8, 0, 6 + (i-1)*32)
                    row.BackgroundTransparency = 1
                    row.ZIndex           = 61
                    row.Parent           = popup

                    local chLbl = Instance.new("TextLabel")
                    chLbl.Size               = UDim2.new(0, 16, 1, 0)
                    chLbl.BackgroundTransparency = 1
                    chLbl.Text               = ch
                    chLbl.TextColor3         = theme.SubText
                    chLbl.Font               = Enum.Font.GothamBold
                    chLbl.TextSize           = 12
                    chLbl.ZIndex             = 62
                    chLbl.Parent             = row

                    local box = Instance.new("TextBox")
                    box.Size               = UDim2.new(1, -24, 1, 0)
                    box.Position           = UDim2.new(0, 20, 0, 0)
                    box.BackgroundColor3   = theme.Background
                    box.BorderSizePixel    = 0
                    box.Text               = tostring(math.round(values[i]))
                    box.TextColor3         = theme.Text
                    box.Font               = Enum.Font.Gotham
                    box.TextSize           = 12
                    box.ZIndex             = 62
                    box.Parent             = row
                    makeCorner(box, 5)

                    box.FocusLost:Connect(function()
                        local n = tonumber(box.Text) or values[i]
                        values[i] = math.clamp(n, 0, 255)
                        box.Text = tostring(math.round(values[i]))
                        currentColor = Color3.fromRGB(values[1], values[2], values[3])
                        preview.BackgroundColor3 = currentColor
                        if opts.Callback then opts.Callback(currentColor) end
                        if opts.Flag then Flux._flags[opts.Flag] = currentColor end
                    end)
                end
            end)

            return {GetValue = function() return currentColor end}
        end

        -- ── SHORTCUT LINK ─────────────────────
        -- Lets a tab add a shortcut circle directly
        function Tab:Shortcut(opts)
            return Flux:AddShortcut(opts)
        end

        return Tab
    end -- Window:Tab

    -- ── KEY SYSTEM ────────────────────────────
    function Window:KeySystem(opts)
        opts = opts or {}
        local validKeys = opts.Keys or {}
        local theme     = Flux._activeTheme or Flux.Themes.Dark
        local root      = getRoot()

        local overlay = Instance.new("Frame")
        overlay.Size                  = UDim2.new(1, 0, 1, 0)
        overlay.BackgroundColor3      = Color3.fromRGB(0, 0, 0)
        overlay.BackgroundTransparency = 0.4
        overlay.ZIndex                = 500
        overlay.Parent                = root

        local card = Instance.new("Frame")
        card.Size               = UDim2.new(0, 300, 0, 140)
        card.AnchorPoint        = Vector2.new(0.5, 0.5)
        card.Position           = UDim2.new(0.5, 0, 0.5, 0)
        card.BackgroundColor3   = theme.Surface
        card.BorderSizePixel    = 0
        card.ZIndex             = 501
        card.Parent             = overlay
        makeCorner(card, 12)
        makeStroke(card, theme.Accent, 1)

        local titleLbl = Instance.new("TextLabel")
        titleLbl.Size               = UDim2.new(1, -20, 0, 28)
        titleLbl.Position           = UDim2.new(0, 10, 0, 10)
        titleLbl.BackgroundTransparency = 1
        titleLbl.Text               = opts.Title or "🔑 Key Required"
        titleLbl.TextColor3         = theme.Text
        titleLbl.Font               = Enum.Font.GothamBold
        titleLbl.TextSize           = 15
        titleLbl.TextXAlignment     = Enum.TextXAlignment.Left
        titleLbl.ZIndex             = 502
        titleLbl.Parent             = card

        local box = Instance.new("TextBox")
        box.Size               = UDim2.new(1, -20, 0, 32)
        box.Position           = UDim2.new(0, 10, 0, 46)
        box.BackgroundColor3   = theme.Background
        box.BorderSizePixel    = 0
        box.Text               = ""
        box.PlaceholderText    = "Enter key..."
        box.TextColor3         = theme.Text
        box.PlaceholderColor3  = theme.SubText
        box.Font               = Enum.Font.Gotham
        box.TextSize           = 13
        box.ZIndex             = 502
        box.Parent             = card
        makeCorner(box, 8)

        local errLbl = Instance.new("TextLabel")
        errLbl.Size               = UDim2.new(1, -20, 0, 16)
        errLbl.Position           = UDim2.new(0, 10, 0, 82)
        errLbl.BackgroundTransparency = 1
        errLbl.Text               = ""
        errLbl.TextColor3         = Color3.fromRGB(240, 60, 60)
        errLbl.Font               = Enum.Font.Gotham
        errLbl.TextSize           = 11
        errLbl.TextXAlignment     = Enum.TextXAlignment.Left
        errLbl.ZIndex             = 502
        errLbl.Parent             = card

        local submitBtn = Instance.new("TextButton")
        submitBtn.Size            = UDim2.new(1, -20, 0, 28)
        submitBtn.Position        = UDim2.new(0, 10, 0, 102)
        submitBtn.BackgroundColor3 = theme.Accent
        submitBtn.BorderSizePixel = 0
        submitBtn.Text            = "Submit"
        submitBtn.TextColor3      = Color3.fromRGB(255,255,255)
        submitBtn.Font            = Enum.Font.GothamBold
        submitBtn.TextSize        = 13
        submitBtn.ZIndex          = 502
        submitBtn.Parent          = card
        makeCorner(submitBtn, 8)

        submitBtn.MouseButton1Click:Connect(function()
            local entered = box.Text
            local valid   = false
            for _, k in ipairs(validKeys) do
                if k == entered then valid = true break end
            end
            if valid then
                overlay:Destroy()
                if opts.Callback then opts.Callback(true, entered) end
            else
                errLbl.Text = "❌ Invalid key. Try again."
                box.Text    = ""
                if opts.Callback then opts.Callback(false, entered) end
            end
        end)

        return overlay
    end

    -- ── CONFIG SAVE / LOAD ────────────────────
    function Window:SaveConfig(name)
        name = name or "Flux_Config"
        local ok, data = pcall(HttpService.JSONEncode, HttpService, Flux._flags)
        if ok then
            writefile(name .. ".json", data)
        end
    end

    function Window:LoadConfig(name)
        name = name or "Flux_Config"
        local ok, data = pcall(readfile, name .. ".json")
        if ok and data then
            local ok2, decoded = pcall(HttpService.JSONDecode, HttpService, data)
            if ok2 then
                for k, v in pairs(decoded) do
                    Flux._flags[k] = v
                end
            end
        end
    end

    table.insert(Flux._windows, Window)
    return Window
end

-- ─────────────────────────────────────────────
--  DESTROY ALL
-- ─────────────────────────────────────────────
function Flux:Destroy()
    local root = LocalPlayer.PlayerGui:FindFirstChild("Flux_Root")
    if root then root:Destroy() end
    Flux._windows  = {}
    Flux._shortcuts = {}
    Flux._flags    = {}
end

return Flux

-- ///////////////////////////////////////////////
-- //              EXAMPLE USAGE               //
-- ///////////////////////////////////////////////
--[[

local Flux = loadstring(game:HttpGet("YOUR_RAW_URL_HERE"))()

local Window = Flux:CreateWindow({
    Title = "My Hub",
    Theme = "Neon",        -- Dark | Light | Neon | Rose | Midnight | Ocean | Blood | Gold | Pastel | Retro
    -- CustomTheme = { Background = Color3.fromRGB(...), ... }  -- optional full override
})

-- Optional key system (shows before anything else)
Window:KeySystem({
    Title = "🔑 Enter License Key",
    Keys  = {"myhub-key-1234"},
    Callback = function(success, key)
        if success then
            Flux:Notify({ Title = "Unlocked!", Description = "Welcome to the hub.", Duration = 3 })
        end
    end
})

local MainTab = Window:Tab({ Title = "Main", Icon = "⚡" })
local VisTab  = Window:Tab({ Title = "Visuals", Icon = "👁" })

MainTab:Section({ Title = "COMBAT" })

MainTab:Toggle({
    Title    = "Aimbot",
    Value    = false,
    Flag     = "aimbot_enabled",
    Callback = function(state)
        print("Aimbot:", state)
    end
})

MainTab:Slider({
    Title    = "FOV",
    Min      = 10,
    Max      = 360,
    Step     = 5,
    Value    = 90,
    Flag     = "aimbot_fov",
    Callback = function(val)
        print("FOV:", val)
    end
})

MainTab:Dropdown({
    Title    = "Aim Part",
    Items    = {"Head", "Torso", "HumanoidRootPart"},
    Value    = "Head",
    Flag     = "aim_part",
    Callback = function(val)
        print("Aim part:", val)
    end
})

MainTab:Button({
    Title    = "Teleport to nearest player",
    Callback = function()
        print("Teleporting!")
    end
})

-- Shortcut circle — appears on left side of screen
MainTab:Shortcut({
    Title    = "Aimbot",
    Icon     = "🎯",
    Value    = false,
    Flag     = "aimbot_enabled",
    Callback = function(state)
        print("Shortcut Aimbot:", state)
    end
})

-- Notification example
Flux:Notify({
    Title       = "Flux Loaded",
    Description = "Hub is ready. Stay safe!",
    Duration    = 5
})

]]
