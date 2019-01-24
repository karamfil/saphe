-- https://github.com/Hammerspoon/Spoons/

CONFIG_KEY_RELOAD = {{"cmd", "alt", "ctrl"}, "R"}


hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 5
hs.window.animationDuration = 0


hs.loadSpoon("ModalMgr")
hs.loadSpoon("WinWin")


hs.alert.show("Config loaded")

hs.hotkey.bind(CONFIG_KEY_RELOAD[1], CONFIG_KEY_RELOAD[2], function() hs.reload() end)




-- APP_SUBLIME = hs.appfinder.appFromName("Sublime Text")
-- hs.tabs.enableForApp(APP_SUBLIME)


-- Window Hints
hs.hints.style = 'vimperator'

hs.hotkey.bind({"alt"}, "`", function() spoon.ModalMgr:deactivateAll() hs.hints.windowHints() end)
-- spoon.ModalMgr.supervisor:bind({"alt"}, "`", '', function()
-- 	spoon.ModalMgr:deactivateAll()
-- 	hs.hints.windowHints()
-- end)


-- MODE Resize
spoon.ModalMgr:new("resizeM")
cmodal = spoon.ModalMgr.modal_list["resizeM"]
last_action = nil

repeatable = function(action, direction, reverse, ignore)
	return function()
		if not ignore then last_action = {action, direction, reverse} end
		spoon.WinWin[action](spoon.WinWin, direction)
	end
end

-- spoon.WinWin:windowStash(hs.window.focusedWindow())

moveAndResize = function(move)
	return function() 
		spoon.WinWin:moveAndResize(move)
		spoon.ModalMgr:deactivate({"resizeM"})
	end
end

cmodal:bind('', 'escape', 'Deactivate resizeM', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)

cmodal:bind('', '.', 'Repeat', function() if last_action then repeatable(last_action[1], last_action[2], '', true)() end end)
cmodal:bind('', ',', 'UnRepeat', function() if last_action then repeatable(last_action[1], last_action[3], '', true)() end end)

cmodal:bind('', 'F', 'Fullscreen', moveAndResize("fullscreen"))
cmodal:bind('', '[', 'Half Left', moveAndResize("halfleft"))
cmodal:bind('', ']', 'Half Right', moveAndResize("halfright"))
cmodal:bind('', 'T', 'Uphalf of Screen', moveAndResize("halfup"))
cmodal:bind('', 'B', 'Downhalf of Screen', moveAndResize("halfdown"))
cmodal:bind('', 'Q', 'Top Left Corner', moveAndResize("cornerNW"))
cmodal:bind('', 'E', 'Top Right Corner', moveAndResize("cornerNE"))
cmodal:bind('', 'Z', 'Bottom Left Corner', moveAndResize("cornerSW"))
cmodal:bind('', 'C', 'Bottom Right Corner', moveAndResize("cornerSE"))

cmodal:bind('', 'A', 'Move Left', repeatable('stepMove', 'left', 'right'))
cmodal:bind('', 'D', 'Move Right', repeatable('stepMove', 'right', 'left'))
cmodal:bind('', 'W', 'Move Up', repeatable('stepMove', 'up', 'down'))
cmodal:bind('', 'S', 'Move Down', repeatable('stepMove', 'down', 'up'))

cmodal:bind('', 'H', 'Stretch Left', repeatable('stepResizeReverse', 'right', 'left'))
cmodal:bind('', 'L', 'Stretch Right', repeatable('stepResize', 'right', 'left'))
cmodal:bind('', 'K', 'Stretch Up', repeatable('stepResizeReverse', 'down', 'up'))
cmodal:bind('', 'J', 'Stretch Down', repeatable('stepResize', 'down', 'up'))

cmodal:bind('shift', 'H', 'Shrink Left', repeatable('stepResizeReverse', 'left', 'right'))
cmodal:bind('shift', 'L', 'Shrink Right', repeatable('stepResize', 'left', 'right'))
cmodal:bind('shift', 'K', 'Shrink Up', repeatable('stepResizeReverse', 'up', 'down'))
cmodal:bind('shift', 'J', 'Shrink Down', repeatable('stepResize', 'up', 'down'))



-- cmodal:bind('', 'C', 'Center Window', function() spoon.WinWin:moveAndResize("center") end)
-- cmodal:bind('', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
-- cmodal:bind('', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)

cmodal:bind('', 'left', 'Move to Left Monitor', function() spoon.WinWin:moveToScreen("left") end)
cmodal:bind('', 'right', 'Move to Right Monitor', function() spoon.WinWin:moveToScreen("right") end)
cmodal:bind('', 'up', 'Move to Above Monitor', function() spoon.WinWin:moveToScreen("up") end)
cmodal:bind('', 'down', 'Move to Below Monitor', function() spoon.WinWin:moveToScreen("down") end)
-- cmodal:bind('', 'space', 'Move to Next Monitor', function() spoon.WinWin:moveToScreen("next") end)

-- cmodal:bind('', '[', 'Undo Window Manipulation', function() spoon.WinWin:undo() end)
-- cmodal:bind('', ']', 'Redo Window Manipulation', function() spoon.WinWin:redo() end)
-- cmodal:bind('', '`', 'Center Cursor', function() spoon.WinWin:centerCursor() end)

-- Register resizeM with modal supervisor
hsresizeM_keys = {"alt", "R"}
spoon.ModalMgr.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "Enter resizeM Environment", function()
	spoon.ModalMgr:deactivateAll()
	spoon.ModalMgr:activate({"resizeM"}, "#333333", "R")
end)

spoon.ModalMgr.supervisor:enter()