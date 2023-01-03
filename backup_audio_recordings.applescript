use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions


tell application "Carbon Copy Cloner"
	activate
	-- From Carbon Copy Cloner, right-click on the task and select Copy Link to Task
	-- This opens Backup to Audio Recordings task
	open location "com.bombich.ccc6.task.open://FFB36EF3-2F44-421E-982F-1A548D65E0BB"
	
	delay 2
	
	-- Trigger Run Now command
	tell application "System Events"
		tell process "Carbon Copy Cloner"
			keystroke "r" using command down
		end tell
	end tell
end tell
