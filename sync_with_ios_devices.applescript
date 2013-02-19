tell application "iTunes"
	repeat with s in sources
		if name of s is not "Library" then
			update s
		end if
	end repeat
end tell