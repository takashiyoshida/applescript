tell application "iTunes"
	repeat with s in sources
		if (name of s is not "Library") and (name of s is not "Internet Radio") then
			eject s
		end if
	end repeat
end tell