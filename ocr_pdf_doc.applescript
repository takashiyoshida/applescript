-- test file to open, OCR and save
set foobar to alias "Cortana:Users:takashi:Downloads:Evernote:20110706215155042 copy.pdf"

tell application "PDFpen"
	set pdfDoc to open foobar
	
	-- INFO: Found a more "correct" way to perform OCR from AppleScript
	-- http://katiefloyd.me/blog/automatically-ocr-documents-with-hazel-and-pdfpen
	tell pdfDoc
		ocr
		repeat while performing ocr
			delay 1
		end repeat
		
		close with saving
	end tell
end tell