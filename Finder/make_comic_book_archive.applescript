use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- set file_extension to ".zip"
set file_extension to ".cbz"


tell application "Finder"
	set theList to selection
	repeat with i from 1 to (count of theList)
		set theItem to (item i of theList) as alias
		set itemPath to quoted form of POSIX path of theItem
		set fileName to name of theItem
		set theFolder to POSIX path of (container of theItem as alias)
		set zipFile to quoted form of (theFolder & fileName & file_extension)
		
		do shell script "zip -jr " & zipFile & " " & itemPath
	end repeat
	
	beep
end tell
