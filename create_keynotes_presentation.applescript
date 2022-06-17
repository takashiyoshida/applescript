use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

property defaultTransitionDuration : 0.5
property defaultTransitionDelay : 2.0
property defaultAutomaticTransition : true

tell application "Keynote"
	activate
	
	set themeNames to name of every theme
	set the chosenTheme to ¬
		(choose from list themeNames with prompt ¬
			"Choose a theme to use:" default items (item 1 of themeNames))
	
	if the chosenTheme is false then error number -128
	
	set dialogMessage to "Standard Size or Widescreen?"
	display dialog dialogMessage buttons {"Cancel", "Standard", "Widescreen"} default button 3
	if the button returned of the result is "Standard" then
		set targetWidth to 1024
		set targetHeight to 768
	else
		set targetWidth to 1920
		set targetHeight to 1080
	end if
	
	set thisDocument to make new document with properties ¬
		{document theme:theme (chosenTheme as string), width:targetWidth, height:targetHeight}
end tell

tell application "OmniOutliner"
	tell front document
		repeat with i from 1 to the count of children
			tell section i
				set thisSectionText to name of it
				
				repeat with q from 1 to the count of children
					tell child q
						set thisSectionText to thisSectionText & return & name of it
						set the childCount to the count of children
						if the childCount ≠ 0 then
							-- Second level bullets
							repeat with z from 1 to the childCount
								set thisSectionText to thisSectionText & return & tab & name of child z
							end repeat
						end if
					end tell
				end repeat
			end tell
			
			set the paragraphCount to the count of paragraphs of thisSectionText
			if the paragraphCount is 1 then
				set the masterSlideName to "Section"
				set thisSlideTitle to thisSectionText
				set thisSlideBody to ""
			else if paragraphCount is 2 then
				set the masterSlideName to "Title"
				set thisSlideTitle to the first paragraph of thisSectionText
				set thisSlideBody to the second paragraph of thisSectionText
			else if paragraphCount ≥ 3 then
				set the masterSlideName to "Title & Bullets"
				set thisSlideTitle to the first paragraph of thisSectionText
				set thisSlideBodyElements to paragraphs 2 thru -1 of thisSectionText
				
				set AppleScript's text item delimiters to return
				set thisSlideBody to thisSlideBodyElements as string
				set AppleScript's text item delimiters to ""
			end if
			
			my createSlide(masterSlideName, thisSlideTitle, thisSlideBody)
		end repeat
	end tell
end tell

tell application "Keynote"
	activate
	
	 tell thisDocument to delete slide 1
end tell

on createSlide(masterSlideName, thisSlideTitle, thisSlideBody)
	try
		tell application "Keynote"
			tell front document
				set thisSlide to make new slide with properties {base layout:slide layout masterSlideName}
				
				tell thisSlide
					set the transition properties to ¬
						{transition effect:dissolve, transition duration:defaultTransitionDuration, transition delay:defaultTransitionDelay, automatic transition:defaultAutomaticTransition}
					
					if title showing is true then
						set the object text of the default title item to thisSlideTitle
					end if
					
					if body showing is true then
						set the object text of the default body item to thisSlideBody
					end if
				end tell
			end tell
		end tell
		return true
	on error
		return false
	end try
end createSlide
