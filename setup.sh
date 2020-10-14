
#!/bin/sh
mkdir ~/.ssh #to store some keys
# Getting current logged in user
loggedInUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk -F': ' '/[[:space:]]+Name[[:space:]]:/ { if ( $2 != "loginwindow" ) { print $2 }}' )
# trigger xcode installation
xcode-select --install

echo "Downloading and installing Brew"
yes '' | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask
brew install wget
brew install python3
ln -s /usr/local/bin/python3 /usr/local/bin/python


brew cask install adobe-creative-cloud
brew cask install adobe-acrobat-pro
brew cask install archiver
brew cask install atom
brew cask install cleanmymac
brew cask install 1Password
brew cask install discord
brew cask install epic-games
brew cask install cyberduck
brew cask install github
brew cask install google-chrome
brew cask install google-drive-file-stream
brew cask install keybase
brew cask install kindle
brew cask install mactracker
brew cask install microsoft-office
brew cask install microsoft-teams
brew cask install openvpn-connect
brew cask install profilecreator
brew cask install sequel-pro
brew cask install shadow
brew cask install spotify
brew cask install firefox
brew cask install slack
brew cask install visual-studio-code
brew cask install stream
brew cask install teamviewer
brew cask install telegram
brew cask install vlc
brew cask install vmware-fusion
brew cask install whatsapp
brew cask install zoomus


brew install defaultbrowser
defaultbrowser chrome

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


killall Dock
killall Finder
killAll cfprefsd
killall SystemUIServer

sudo softwareupdate --schedule on
exit 0
