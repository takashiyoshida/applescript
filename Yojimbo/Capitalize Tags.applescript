use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions

-- Use Objective-C function call NSString capitalizedString to capitalize 
-- a given tag.
on capitalize(txt)
	set str to current application's NSString's stringWithString:txt
	set cap_txt to str's capitalizedString
	return cap_txt
end capitalize

-- This script is not meant to capitalize all tags in one-go.
-- But you can modify it easily to capitalize all tags too.
tell application "Yojimbo"
	set all_tags to every tag
	repeat with t in all_tags
		if (name of t) starts with "Z" then
			set res_tag to my capitalize(name of t)
			set name of t to res_tag as string
		end if
	end repeat
end tell
