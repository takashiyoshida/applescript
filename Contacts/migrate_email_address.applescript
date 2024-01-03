use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

property oldDomain : "thalesgroup.com"
property newDomain : "urbanandmainlines.com"


tell application "Contacts"
	-- activate
	
	set _people to selection
	repeat with _person in _people
		repeat with _email in email of _person
			set emailAddr to value of _email
			if emailAddr contains oldDomain then
				set _index to offset of "@" in emailAddr
				
				set newEmailAddr to (text items 1 thru _index) of emailAddr as string
				set newEmailAddr to newEmailAddr & newDomain
				set (value of _email) to newEmailAddr
			end if
		end repeat
	end repeat
	
	-- save
end tell
