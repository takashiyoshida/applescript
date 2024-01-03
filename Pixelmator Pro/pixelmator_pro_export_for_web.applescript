use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- Choose destination directory
set destFolder to choose folder with prompt "Select a folder for exporting Pixelmator images"

tell application "Pixelmator Pro"
	tell its front document
		set visible of every layer of every group layer to false
		
		repeat with _groupLayer in every group layer
			tell application "Finder"
				set groupFolder to destFolder & (name of _groupLayer) as text
				if not (exists groupFolder) then
					set groupFolder to make new folder at destFolder with properties {name:(name of _groupLayer)}
				else
					set groupFolder to groupFolder as alias
				end if
			end tell
			
			repeat with _layer in every layer of _groupLayer
				set _exportFile to (groupFolder as text) & (name of _layer & ".png") as text
				
				set visible of _layer to true
				export for web to _exportFile as PNG
				set visible of _layer to false
			end repeat
		end repeat
		
		set visible of every layer of every group layer to true
	end tell
end tell
