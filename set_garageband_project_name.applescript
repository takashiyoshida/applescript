-- This script is used to acquire GarageBand's project name.
-- Unfortunately, GarageBand is not scriptable via AppleScript so I need to 
-- use System Events to get the title of GarageBand window
--
-- This script is used at the end of Create GarageBand Project macro in Keyboard Maestro.
-- for creating GarageBand project from Microsoft Teams'
-- audio logs (recorded via Audio Hijack).

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "System Events"
	tell process "GarageBand"
		set gb_title to title of window 1
		
		tell application "Keyboard Maestro Engine"
			setvariable "GB_PROJECT" to gb_title
		end tell
	end tell
end tell
