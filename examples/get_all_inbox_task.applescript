use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "OmniFocus"
	activate
	tell default document
		get every inbox task whose completed is false
	end tell
end tell