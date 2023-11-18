use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "OmniFocus"
	tell front document
		tell front document window
			set perspective name to "Forecast"
		end tell
	end tell
	activate
end tell