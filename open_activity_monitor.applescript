-- Start Activity Monitor
tell application "Activity Monitor" to activate

tell application "System Events"
	tell process "Activity Monitor"
		tell toolbar 1 of window 1
			-- there are 3 groups and group 2 is the one with a radio group
			tell radio group 1 of group 2
				click radio button "Energy"
			end tell
		end tell
	end tell
end tell
