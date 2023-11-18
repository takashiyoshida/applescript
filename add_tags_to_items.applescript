use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set foobar to display dialog "Add (comma-delimited) tags to selected items" default answer "" buttons {"Cancel", "Add"} default button "Add" with title "Yojimbo"

set old_delimiters to AppleScript's text item delimiters
set AppleScript's text item delimiters to ", "

if button returned of foobar is "Add" then
	set _tags to every text item of (text returned of foobar)
	
	tell application "Yojimbo"
		set the_selections to selection
		repeat with the_item in the_selections
			tell the_item
				add tags _tags to the_item
			end tell
		end repeat
	end tell
end if

set AppleScript's text item delimiters to old_delimiters
