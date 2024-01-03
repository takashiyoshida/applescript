use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Safari"
	tell front window
		set _currName to name of current tab
		set _currURL to URL of current tab
	end tell
	
	tell application "Shortcuts Events"
		run the shortcut named "Add to Interesting Links" with input _currURL
	end tell
end tell
