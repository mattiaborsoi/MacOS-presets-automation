#!/bin/sh
mkdir ~/.ssh #to store some keys

echo "Downloading and installing Brew"
yes '' | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install wget

#default apps
brew install atom
brew install 1Password
brew install keybase
brew install slack
brew install visual-studio-code
brew install google-chrome
brew install defaultbrowser
defaultbrowser chrome
brew remove defaultbrowser
brew install spotify

#work apps
brew install google-drive-file-stream
brew install cyberduck
brew install microsoft-teams
brew install docker
brew install microsoft-office
brew install openvpn-connect
brew install sequel-pro
brew install microsoft-office
brew install github
brew install zoomus

#personal apps
brew install adobe-creative-cloud
brew install adobe-acrobat-pro
brew install archiver
brew install burp-suite
brew install whatsapp
brew install telegram
brew install kindle
brew install mactracker
brew install discord
brew install epic-games
brew install cleanmymac
brew install teamviewer
brew install vlc
brew install --cask nvidia-geforce-now

brew install cheat
brew install bat



# save to disk (not iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
# Show path and status bar in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool true
# Empty Bin every 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool true
# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show the ~/Library folder
chflags nohidden ~/Library
# Default to Desktop directory
defaults write com.apple.finder NewWindowTarget PfDe
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
# Disable game center
launchctl unload /System/Library/LaunchAgents/com.apple.gamed.plist 2> /dev/null
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Set the icon size of Dock items to 42 pixels
defaults write com.apple.dock tilesize -int 42
# TextEdit developer settings
defaults write com.apple.TextEdit RichText -int 0
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Download newly available updates in background
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Install System data files & security updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
# Enable the automatic update check
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true
# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0
# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
# macOS: Display additional information on the loginscreen for 60 seconds
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
# macOS: set the date and time format to display Thu 18 Aug 23:46 on the menu bar
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm"


killall Dock
killall Finder
killAll cfprefsd
killall SystemUIServer

sudo softwareupdate --schedule on
exit 0
