use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions


tell application "Carbon Copy Cloner"
	activate

	-- This opens Backup to Audio Recordings task
	open location "com.bombich.ccc6.task.open://E85263F6-F856-4CFB-94AC-721F59F83064"

	delay 2

	-- Trigger Run Now command
	tell application "System Events"
		tell process "Carbon Copy Cloner"
			keystroke "r" using command down
		end tell
	end tell
end tell
