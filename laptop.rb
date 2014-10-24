dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "workstation"
end

dep "workstation" do
  requires "personal dotfiles"

  # Packages
  requires "wget.managed"

  # Apps
  requires "doxie"
  requires "firefox"
  requires "fluid"
  requires "gitx-rowanj"
  requires "google-chrome"
  requires "hazel"
  requires "imageoptim"
  requires "launchbar"
  requires "licecap"
  requires "mailplane"
  requires "openemu"
  requires "rdio"
  requires "slack"
  requires "skype"
  requires "sublime-text3"
  requires "superduper"
  requires "textexpander"
  requires "tokens"
  requires "transmit"
  requires "onepassword"
  requires "virtualbox"
  requires "vlc"
end
