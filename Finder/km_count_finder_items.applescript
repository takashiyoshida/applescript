-- Count the number of selected Finder items
-- This script is used as a part of Rename Files Sequentially macro
-- in Keyboard Maestro.

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

tell application "Finder"
	return (count of (selection as alias list))
end tell