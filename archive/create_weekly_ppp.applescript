property PPP_SUBJECT : "Weekly PPP - Team Name"

property PPP_RECIPIENT_NAME : "recipient name"
property PPP_RECIPIENT_ADDRESS : "recipient@example.com"

on run
	set ppp_content to the clipboard
	
	tell application "Airmail 3"
		-- Used to think `sender` property was necessary but it keeps getting added to `to` recipeints
		set weekly_ppp to make new outgoing message at the end of outgoing messages with properties {subject:PPP_SUBJECT, htmlContent:ppp_content}
		tell weekly_ppp
			make new to recipient at the end of to recipients with properties {name:PPP_RECIPIENT_NAME, address:PPP_RECIPIENT_ADDRESS}
			compose
		end tell
		
		activate
	end tell
end run