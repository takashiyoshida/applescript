tell application "iTunes"
	repeat with device in (every source whose kind is iPod)
		update device
	end repeat
end tell