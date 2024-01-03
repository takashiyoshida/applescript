use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- This script makes all layers visible
tell application "Pixelmator Pro"
	activate
	
	tell its front document
		set visible of every layer of every group layer to true
	end tell
end tell
