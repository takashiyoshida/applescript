-- Convert single-digit day, hour, minute and second into two-digit format
on prepend_zero(theNum)
	if theNum < 10 then
		set theNum to "0" & theNum as string
	end if
	return theNum
end prepend_zero

-- Create a timestamp in YYYY-mm-dd-HHMMSS format
on get_timestamp(theDate)
	set the_month to my prepend_zero((month of theDate) as integer)
	set the_day to my prepend_zero((day of theDate) as integer)
	set the_hour to my prepend_zero((hours of theDate) as integer)
	set the_minutes to my prepend_zero((minutes of theDate) as integer)
	set the_seconds to my prepend_zero((seconds of theDate) as integer)
	return (year of theDate) & "-" & the_month & "-" & the_day & "-" & the_hour & the_minutes & the_seconds as string
end get_timestamp

-- Returns true when exporting images is complete
on exportDone(targetDir)
	set oldSize to size of (info for targetDir)
	delay 5
	set newSize to size of (info for targetDir)
	repeat while newSize ­ oldSize
		set oldSize to newSize
		delay 3
		set newSize to size of (info for targetDir)
	end repeat
	return true
end exportDone

-- Replace 'find' with 'replace' when found in 'someText'
-- This is used to replace file extension when video file is exported from Photos
on replaceText(find, replace, someText)
	set prevTIDs to text item delimiters of AppleScript
	set text item delimiters of AppleScript to find
	set someText to text items of someText
	set text item delimiters of AppleScript to replace
	set someText to "" & someText
	set text item delimiters of AppleScript to prevTIDs
	return someText
end replaceText

on renameFile(theFile, targetDir, newName)
	tell application "Finder"
		if not (exists (targetDir & newName) as string) then
			try
				set name of (theFile as alias) to newName
			on error x number y
				return y
			end try
		end if
		return 0
	end tell
end renameFile

set destination to choose folder default location (path to home folder)
set theImageCount to 0

tell application "Photos"
	set theImages to selection
	export theImages to destination
	
	if my exportDone(destination) then
		repeat with i in theImages
			set timestamp to my get_timestamp(date of i)
			set newName to timestamp & "-" & filename of i as string
			set oldFile to (destination & (filename of i)) as string
			
			tell application "Finder"
				set theResult to my renameFile(oldFile, destination, newName)
				if theResult = -43 then
					-- By default, when Photos export a ".MOV" file, it will export this file in ".m4v" format
					-- Adjust the oldFile and newName accordingly
					if (oldFile as string) ends with "MOV" then
						set oldFile to my replaceText("MOV", "m4v", oldFile)
						set newName to my replaceText("MOV", "m4v", newName)
						set theResult to my renameFile(oldFile, destination, newName)
					end if
				end if
			end tell
			set theImageCount to theImageCount + 1
		end repeat
	end if
end tell

tell application "Finder"
	open destination
	activate
	beep
	display notification theImageCount & " images exported" as string with title "Photos"
end tell