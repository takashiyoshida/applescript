tell application "Finder"
	set screenRect to get bounds of window of desktop
	display dialog "Current screen resolution is " & (item 3 of screenRect) & " by " & (item 4 of screenRect) buttons {"OK"} default button "OK" with icon note giving up after 5
end tell