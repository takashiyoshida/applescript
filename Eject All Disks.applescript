use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set ejectable_disks to {}

tell application "System Events"
	-- Only eject disks that are under /Volumes and does not end with ".backup"
	set ejectable_disks to name of every disk whose (POSIX path begins with "/Volumes" and ¬
		volume does not end with ".backup")
	
	tell application "Finder"
		repeat with _disk in ejectable_disks
			eject _disk
		end repeat
	end tell
end tell

-- beep once to indicate that the script is done
beep