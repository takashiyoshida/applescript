use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

set _startDate to current date
set time of _startDate to 0
set _endDate to (current date) + (1 * days)

set _tasks to {}

tell application "OmniFocus"
	tell front document
		set _projects to every flattened project whose status is active status
		
		repeat with p in _projects
			set _tasks to _tasks & (every task of p whose completed is false and dropped is false and due date ≥ _startDate and due date < _endDate)
		end repeat
	end tell
end tell

display dialog "There are " & (count of _tasks) & " today."
