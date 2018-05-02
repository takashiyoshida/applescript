property k_minutes : 60

on adding folder items to this_folder after receiving added_items
	try
		tell application "PDFpen"
			activate
			repeat with curr_item in added_items
				set openPdf to open curr_item
				with timeout of 5 * k_minutes seconds
					tell openPdf
						ocr
						repeat while performing ocr
							delay 1
						end repeat
						close with saving
					end tell
				end timeout
			end repeat
		end tell
	end try
end adding folder items to
