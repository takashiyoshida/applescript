tell application "Finder"
	set the_windows to windows
	repeat with w in the_windows
		log "name: " & name of w
		tell w to close
	end repeat
end tell