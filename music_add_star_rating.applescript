use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Music"
	if player state is playing or player state is paused then
		if rating of current track ≥ 100 then
			set rating of current track to 0
		else
			set rating of current track to (rating of current track) + 20
		end if
	end if
end tell
