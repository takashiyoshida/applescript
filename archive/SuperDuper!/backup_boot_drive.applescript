set backupSettings to "Cortana:Users:takashi:Library:Application Support:SuperDuper!:Saved Settings:Cortana-daily.sdsp:" as alias
tell application "SuperDuper!"
	activate
	
	try
		do shell script "sleep 5"
		if status is idle then
			run using settings backupSettings without user interaction
		end if
		repeat while status is running
			do shell script "sleep 6"
		end repeat
		if status is done then
			tell application "SuperDuper!" to quit
			do shell script "sleep 7"
		end if
	on error errMsg
		display dialog "Oops! ... " & errMsg
	end try
end tell

display notification "Backup complete! Unmount and power down the backup drive" with title "SuperDuper!"