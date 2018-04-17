property defaultFolders : {"/Users/takashi", "/Users/takashi/Desktop", "/Users/takashi/Documents", "/Users/takashi/Downloads", "/Users/takashi/Projects"}

tell application "Finder"
	set finderWindow to make new Finder window at the end of Finder windows
	repeat with i from 1 to count of defaultFolders
		set target of finderWindow to POSIX file (item i of defaultFolders)
		if i = (count of defaultFolders) then
			exit repeat
		end if
		tell application "System Events"
			tell process "Finder"
				set frontmost to true
				keystroke "t" using command down
				delay 0.2
			end tell
		end tell
	end repeat
end tell