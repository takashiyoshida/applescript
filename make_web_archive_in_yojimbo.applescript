tell application "Safari"
	tell front window
		set current_url to URL of current tab
		set current_name to name of current tab
	end tell
end tell

tell application "Yojimbo"
	set _archive to make new web archive item with contents current_url with properties {name:current_name}
	activate
end tell
