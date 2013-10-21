set tabUrl to ""

tell application "Safari"
	
	repeat with w in every window
		try
			set tabName to name of current tab of w
			set tabUrl to URL of current tab of w
			exit repeat
		on error x number y
			-- in this case, ignore this window
			-- display dialog x & " " & y
		end try
	end repeat
end tell

tell application "Google Chrome"
	set currWindow to missing value
	
	if (count of windows) = 0 then
		set currWindow to make new window
	else
		repeat with w in every window
			set currWindow to w
			exit repeat
		end repeat
	end if
	
	make new tab at the end of tabs in currWindow with properties {URL:tabUrl}
	activate
end tell
