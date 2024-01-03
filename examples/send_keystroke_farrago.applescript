use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "System Events"
	tell process "Farrago"
		keystroke "q"
	end tell
end tell