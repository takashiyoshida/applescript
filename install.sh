#!/bin/sh

Compile()
{
	OUTPUT=$1
	SOURCE=$2
	osacompile -o "${OUTPUT}" ${SOURCE}
}

Compile "Sync with iOS Devices.scpt" "sync_with_ios_devices.applescript"
Compile "Download Podcasts.scpt" "download_podcasts.applescript"
