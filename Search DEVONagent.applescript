use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "DEVONagent"
	activate
	-- This essentially creates a new search window with the search string but does not yet perform a search 
	search "(BetterTouchTool OR BTT) AND Stream Deck AND Lua"
end tell