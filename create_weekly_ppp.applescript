property EMAIL_SUBJECT : "Weekly PPP - Test Automation Platform"
property EMAIL_SENDER : "enter your email"
property EMAIL_RECEIVER_NAME : "enter recipient name"
property EMAIL_RECEIVER_ADDR : "enter recipient email address"

property GREETING : "<p>Hello all,</p>"
property GOODBYE : "<p>Regards,</p>"


on create_new_message(html_source)
	tell application "Airmail 3"
		set the_message to make new outgoing message at the end of outgoing messages with properties {subject:EMAIL_SUBJECT, sender:EMAIL_SENDER, htmlContent:html_source}
		make new to recipient at the end of to recipient of the_message with properties {name:EMAIL_RECEIVER_NAME, address:EMAIL_RECEIVER_ADDR}
		compose the_message
		activate
	end tell
end create_new_message


tell application "Safari"
	tell front window
		set the_name to name of current tab
		set the_url to URL of current tab
		
		-- It would be better if we can parse the HTML source and get some nicer output...
		-- but AppleScript isn't really built for this kind of thing
		set the_source to source of current tab
	end tell
end tell


-- Create HTML message for the weekly PPP
set the_content to "Please refer to our <a href=\"" & the_url & "\" alt=\"" & the_name & "\">" & the_name & "</a>.</p>"
set html_body to GREETING & return & the_content & return & GOODBYE

my create_new_message(html_body)