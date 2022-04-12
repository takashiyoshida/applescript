use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Music"
	-- shuffle mode: albums, groupings, songs
	-- shuffle enabled: true, false
	
	if not shuffle enabled then
		set shuffle mode to albums
		set shuffle enabled to true
	else if shuffle enabled and shuffle mode is albums then
		set shuffle mode to groupings
	else if shuffle enabled and shuffle mode is groupings then
		set shuffle mode to songs
	else if shuffle enabled and shuffle mode is songs then
		set shuffle enabled to false
	end if
end tell