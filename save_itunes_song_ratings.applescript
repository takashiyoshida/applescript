property musicList : "Music"
property rootSource : "Library"

set trackRecordList to {}

tell application "iTunes"
	set trackList to every file track of playlist musicList of source rootSource
	repeat with t in trackList
		set trackRecord to {artist:(artist of t), album:(album of t), name:(name of t), rating:(rating of t)}
		set end of trackRecordList to trackRecord
	end repeat
	
	set filePath to (path to desktop as string) & "iTunes Song Ratings.txt"
	try
		set fileRef to open for access file filePath with write permission
		repeat with t in trackRecordList
			set metadata to (artist of t) & tab & (album of t) & tab & (name of t) & tab & (rating of t) as text
			write (metadata & return) to fileRef starting at eof
		end repeat
		close access fileRef
	on error x number y
		try
			close access file filePath
			display alert x & ":" & y
		end try
	end try
end tell

