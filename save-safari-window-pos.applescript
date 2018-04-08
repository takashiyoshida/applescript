property numOfSafariWindows : 0
property posOfSafariWindows : {}
property sizeOfSafariWindows : {}

set theResults to display dialog "Restore window positions or save window positions?" buttons {"Restore", "Save"} default button "Restore"
log theResults

if (button returned of theResults) is "Restore" then
	tell application "Safari"
		log {"numOfSafariWindows: " & numOfSafariWindows}
		if (count of windows) < numOfSafariWindows then
			repeat with i from (1 + (count of windows)) to numOfSafariWindows
				make new document at the end of documents
			end repeat
		end if
	end tell
	
	tell application "System Events"
		tell process "Safari"
			repeat with i from 1 to numOfSafariWindows
				set position of window i to (item i of posOfSafariWindows)
				set size of window i to (item i of sizeOfSafariWindows)
			end repeat
		end tell
	end tell
else
	tell application "System Events"
		tell process "Safari"
			-- count of windows reflect the number of windows in the current desktop
			-- if your current virtual desktop has no Safari windows, it will be zero
			if (count of windows) > 0 then
				set numOfSafariWindows to count of windows
				set posOfSafariWindows to {}
				set sizeOfSafariWindows to {}
				
				repeat with i from 1 to numOfSafariWindows
					set end of posOfSafariWindows to (position of window i)
					set end of sizeOfSafariWindows to (size of window i)
				end repeat
			end if
			log {"numOfSafariWindows: " & numOfSafariWindows}
		end tell
	end tell
end if

