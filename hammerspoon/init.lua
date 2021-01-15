-- Reload Config
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
spoon.ReloadConfiguration:bindHotkeys({reloadConfiguration = {{"cmd", "alt", "ctrl"}, "R"}})

-- Toggle showing seconds in menubar lock
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "S", function()
  -- Get current state
  format = hs.execute("defaults read com.apple.menuextra.clock DateFormat")

  -- Trim whitespace
  format = format:gsub("^%s*(.-)%s*$", "%1")

    -- Toggle format
  format = (format == "EEE MMM d  h:mm a") and "EEE MMM d  h:mm:ss a" or "EEE MMM d  h:mm a"

  -- Write new format and restart the menubar
  command = 'defaults write com.apple.menuextra.clock DateFormat -string "' .. format .. '" && killall SystemUIServer'
  hs.execute(command)
end)

--[[ Direction Window Movements:
--   y k u
--   h   l
--   b j n
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Y", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x - 10
  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.y = f.y + 10
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()

  f.x = f.x + 10
  f.y = f.y + 10
  win:setFrame(f)
end)
]]

-- Resize Window to Left or Right Side
hs.hotkey.bind({"cmd", "alt", "shift"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "shift"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "shift"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- Window positions
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  local laptopScreen = "Color LCD"
  local windowLayout = {
      {"iTerm2",  nil,          laptopScreen, hs.layout.left50,    nil, nil},
      {"Code",    nil,          laptopScreen, hs.layout.right50,   nil, nil},
  }
  hs.layout.apply(windowLayout)
end)

-- Wifi
function mute()
  hs.audiodevice.defaultOutputDevice():setVolume(0)
  hs.audiodevice.defaultOutputDevice():setMuted(true)
end

hs.loadSpoon("WiFiTransitions")
spoon.WiFiTransitions.actOnNilTransitions = true
spoon.WiFiTransitions.actions = {{from="GLERJ", fn=mute}}
spoon.WiFiTransitions:start()

-- Brew Info
hs.loadSpoon("BrewInfo")
spoon.BrewInfo:bindHotkeys({
  show_brew_info = {{"cmd","alt","ctrl"}, "B"},
  open_brew_url = {{"cmd","alt","ctrl"}, "Q"},
  show_brew_cask_info = {{"cmd","alt","ctrl"}, "C"},
  open_brew_cask_url = {{"cmd","alt","ctrl"}, "E"}
})

-- Emojis
-- hs.loadSpoon("Emojis")
-- spoon.Emojis:bindHotkeys({toggle={{"cmd", "alt", "ctrl"}, "E"}})

-- Keyboard Shortcut Sheet
hs.loadSpoon("KSheet")
spoon.KSheet:bindHotkeys({
  toggle={{"cmd", "alt", "ctrl"}, "D"}
})

-- Mouse Circle
hs.loadSpoon("MouseCircle")
spoon.MouseCircle:bindHotkeys({show={{"cmd", "alt", "ctrl"}, "M"}})

-- Move windows between monitors
hs.loadSpoon("WindowScreenLeftAndRight")
spoon.WindowScreenLeftAndRight:bindHotkeys(spoon.WindowScreenLeftAndRight.defaultHotkeys)

-- Screen Rotation
hs.loadSpoon("ToggleScreenRotation")
spoon.ToggleScreenRotation:bindHotkeys({["DELL U2515H"] = {{"cmd", "alt", "ctrl"}, "O"}})
