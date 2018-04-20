-- A generic script to add items to Yojimbo
-- This is meant to be used as a Folder Actions. In order to make the script available for 
-- Folder Actions script, copy the script to ~/Library/Scripts/Folder Actions or /Library/Scripts/Folder Actions.

-- When files are dropped into a designated folder, the script will import the files into
-- Yojimbo and add tags on them.

-- Modify tag_list to your liking
property tag_list : {"applescript", "automation"}

on adding folder items to this_folder after receiving added_items
	repeat with this_item in added_items
		log "this_item: " & this_item -- Does anyone know how to debug Folder Actions?
		
		tell application "Yojimbo"
			set added_item to import this_item
			tell added_item
				add tags tag_list to added_item
			end tell
		end tell
	end repeat
	
	-- Finally, activate Yojimbo
	tell application "Yojimbo" to activate
end adding folder items to
