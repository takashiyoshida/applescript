-- properties --

property musicList : "Music"
property rootSource : "Library"

property dropboxPath : "Dropbox:"
property ratingsFile : "iTunes Song Ratings.txt"

-- main script -- 

set trackRecordList to {}
set filePath to (path to home folder as string) & dropboxPath & ratingsFile

tell application "iTunes"
	set trackRecordList to my get_track_records()
	my write_track_records(filePath, trackRecordList)
end tell

on get_track_records()
	set trackRecordList to {}
	tell application "iTunes"
		set trackList to every track of playlist musicList of source rootSource whose rating > 0
		repeat with t in trackList
			set trackRecord to {artist:(artist of t), album:(album of t), name:(name of t), rating:(rating of t)}
			set end of trackRecordList to trackRecord
		end repeat
	end tell
	return trackRecordList
end get_track_records

on write_track_records(filePath, trackRecordList)
	tell application "iTunes"
		try
			set fileRef to open for access file filePath with write permission
			repeat with t in trackRecordList
				set metadata to (artist of t) & tab & (album of t) & tab & (name of t) & tab & (rating of t) as text
				write (metadata & return) to fileRef starting at eof
			end repeat
			close access fileRef
		on error x number y
			close access file filePath
			display alert x & " : " & y
		end try
	end tell
end write_track_records