use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- set theFile to choose file of type {"PDF"}
set theFile to alias "Gabriela:Users:takashi:Downloads:ocr-documents:6745592652.pdf"

tell application "PDFpenPro"
	open theFile as alias
	tell document 1
		ocr
		repeat while performing ocr
			delay 1
		end repeat
		delay 1
		close with saving
	end tell
	quit
end tell
