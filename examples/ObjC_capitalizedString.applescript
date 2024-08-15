use AppleScript version "2.4" -- Yosemite (10.10) or later
use framework "Foundation"
use scripting additions

-- Example of making Objective-C function call in AppleScript

set foo to "hello world"

set baz to current application's NSString's stringWithString:foo
set res to baz's capitalizedString