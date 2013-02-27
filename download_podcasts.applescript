if not is_iTunesRunning() then return

tell application "iTunes" to updateAllPodcasts

to is_iTunesRunning()
	tell application id "sevs" to return (exists (some process whose name is "iTunes"))
end is_iTunesRunning
