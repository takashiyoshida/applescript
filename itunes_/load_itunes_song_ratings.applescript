property dropboxPath : "Dropbox:"
property ratingsFile : "iTunes Song Ratings.txt"

property musicList : "Music"
property rootSource : "Library"

set filePath to (path to home folder as string) & dropboxPath & ratingsFile

try
	--	set fileRef to open for access file filePath
	set trackData to paragraphs of (read file filePath)
	--	close access fileRef
	
	tell application "iTunes"
		set oldDelimiters to AppleScript's text item delimiters
		set AppleScript's text item delimiters to tab
		
		repeat with t in trackData
			set trackItem to every text item of t
			if trackItem is not {} then
				set trackRecord to (every track of playlist musicList of source rootSource whose artist is (item 1 of trackItem) and album is (item 2 of trackItem) and name is (item 3 of trackItem))
				if (count of trackRecord) = 1 then
					set rating of (item 1 of trackRecord) to (item 4 of trackItem)
				end if
			end if
		end repeat
	end tell
on error x number y
	-- close access file filePath
	display alert x & " : " & y
end try