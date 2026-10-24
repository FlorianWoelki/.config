tell application "Zed" to activate
delay 0.3
tell application "System Events"
	tell process "Zed"
		set position of window 1 to {0, 0}
		set size of window 1 to {1680, 855}
	end tell
end tell
