tell application "Spark"
	activate
	
	tell application "System Events"
		tell process "Spark"
			keystroke "f" using {command down, option down}
		end tell
	end tell
end tell
