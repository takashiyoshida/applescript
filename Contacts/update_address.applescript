use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Contacts"
	set _people to selection
	repeat with _person in _people
		repeat with _address in address of _person
			-- set street of _address to "21 Changi North Rise"
			set city of _address to "Singapore"
			-- set zip of _address to "498788"
			
			set _country to country of _address
			if _country = "SG" or _country = "Singapore" then
				set country of _address to "Singapore"
				set country code of _address to "SG"
			end if
		end repeat
	end repeat
	
	save
end tell