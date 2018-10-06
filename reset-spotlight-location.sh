#!/bin/sh

# resets window location
defaults delete com.apple.Spotlight userHasMovedWindow

# resets window size
defaults delete com.apple.Spotlight windowHeight

	# restart spotlight
killAll Spotlight
