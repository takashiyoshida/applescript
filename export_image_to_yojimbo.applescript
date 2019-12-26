use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- Get the selected photos and export them to a temporary location
set temp_dir to alias "Gabriela:Users:takashi:Desktop:test:"

tell application "Photos"
	export selection to the temp_dir
end tell

-- Get a list of JPEG files under the temp_dir
tell application "Finder"
	set the_images to files in the temp_dir whose name extension is "jpeg"
end tell

tell application "Yojimbo"
	repeat with this_image in the_images
		set added_image to import (this_image as alias)
		tell added_image
			-- Ask for image name to be used in Yojimbo
			set result to display dialog "Enter image name" default answer "image name" buttons {"OK"} default button "OK" with icon note
			
			if text returned of result is not "" then
				set name of the added_image to the text returned of result
			end if
			
			-- Ask for tags to be used in Yojimbo
			set result to display dialog "Enter tags" default answer "" buttons {"OK"} default button "OK" with icon note
			if text returned of result is not "" then
				set image_tags to my createTags(text returned of result)
				add tags image_tags
			end if
		end tell
	end repeat
end tell

on createTags(_rawTags)
	set origDelimiters to AppleScript's text item delimiters
	set AppleScript's text item delimiters to ","
	set theTags to every text item of _rawTags
	set AppleScript's text item delimiters to origDelimiters
	
	return theTags
end createTags
