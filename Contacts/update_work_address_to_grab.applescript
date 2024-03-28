use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

property _grab_street : "9 Straits View, #22-01 Marina One West Tower"
property _grab_city : "Singapore"
property _grab_zip : "018937"
property _grab_country : "Singapore"
property _grab_country_code : "SG"

tell application "Contacts"
	set _people to selection
	repeat with _person in _people
		if number of addresses of _person > 0 then
			repeat with _address in address of _person
				if label of _address is "work" then
					set street of _address to _grab_street
					set city of _address to _grab_city
					set zip of _address to _grab_zip
					
					set _country to country of _address
					if _country = "SG" or _country = "Singapore" then
						set country of _address to _grab_country
						set country code of _address to _grab_country_code
					end if
				end if
			end repeat
		else
			set _address to make new address with properties {label:"work"} at the end of addresses of _person
			set street of _address to _grab_street
			set city of _address to _grab_city
			set zip of _address to _grab_zip
			
			set _country to country of _address
			if _country = "SG" or _country = "Singapore" then
				set country of _address to _grab_country
				set country code of _address to _grab_country_code
			end if
		end if
	end repeat
	
	save
end tell
