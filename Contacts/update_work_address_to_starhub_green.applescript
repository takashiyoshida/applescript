use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

property _starhub_green_street : "67 Ubi Avenue 1, South Tower #02-13"
property _starhub_green_city : "Singapore"
property _starhub_green_zip : "408942"
property _starhub_green_country : "Singapore"
property _starhub_green_country_code : "SG"


tell application "Contacts"
	set _people to selection
	repeat with _person in _people
		if number of addresses of _person > 0 then
			repeat with _address in address of _person
				if label of _address is "work" then
					set street of _address to _starhub_green_street
					set city of _address to _starhub_green_city
					set zip of _address to _starhub_green_zip
					
					set _country to country of _address
					if _country = "SG" or _country = "Singapore" then
						set country of _address to _starhub_green_country
						set country code of _address to _starhub_green_country_code
					end if
				end if
			end repeat
		else
			set _address to make new address with properties {label:"work"} at the end of addresses of _person
			
			set street of _address to _starhub_green_street
			set city of _address to _starhub_green_city
			set zip of _address to _starhub_green_zip
			
			set _country to country of _address
			if _country = "SG" or _country = "Singapore" then
				set country of _address to _starhub_green_country
				set country code of _address to _starhub_green_country_code
			end if
		end if
	end repeat
	
	save
end tell
