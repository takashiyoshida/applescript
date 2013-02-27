#!/bin/sh

Compile()
{
	OUTPUT=$1
	SOURCE=$2
	osacompile -o "${OUTPUT}" ${SOURCE}
}

USER_SCRIPT="${HOME}/Library/Scripts"

# For some of these scripts (for now, all), the compiled form should go to
# ~/Library/

# To install under ~/Library/ so that I can use them from any applications
Compile "${USER_SCRIPT}/Sync with iOS Devices.scpt" "sync_with_ios_devices.applescript"
Compile "${USER_SCRIPT}/Download Podcasts.scpt" "download_podcasts.applescript"

Compile "${USER_SCRIPT}/Switch to Quiet Mode.scpt" "switch_to_quiet_mode.applescript"
