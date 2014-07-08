-- test file to open, OCR and save
set foobar to alias "Cortana:Users:takashi:Downloads:Evernote:20110706215155042 copy.pdf"

tell application "PDFpen"
	set pdfDoc to open foobar
	
	-- I don't know if I need timeout... some larger PDF may need extra time
	-- to read and OCR	
	with timeout of 120 seconds
		tell pdfDoc to ocr
	end timeout
	
	delay 20
	-- I intend to have only one document open (for now)
	save item 1 of documents
	
	delay 3
	close item 1 of documents
end tell