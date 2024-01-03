use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Music"
	if song repeat is off then
		set song repeat to one
	else if song repeat is one then
		set song repeat to all
	else
		set song repeat to off
	end if
end tell
