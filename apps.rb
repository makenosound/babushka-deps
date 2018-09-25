dep "apps" do
  requires "mac app store apps"
  requires "homebrew cask apps"
end

dep "mac app store apps" do
  requires "1Blocker.mas"
  requires "Things3.mas"
  requires "Reeder.mas"
  requires "Pixelmator.mas"
  requires "Fantastical.mas"
  requires "Tweetbot.mas"
  requires "Icon Slate.mas"
  requires "The Unarchiver.mas"
  requires "Rested.mas"
  requires "RegExRX.mas"
  requires "Deckset.mas"
  requires "Soulver.mas"
  requires "iA Writer.mas"
end

# Apps installed from the Mac App Store
meta :mas do
  accepts_value_for :name, :basename
  accepts_value_for :id

  template {
    requires "mas.managed"

    def installed?
      # Extract app names from lines like "413857545 Divvy (1.5.1)"
      installed_ids = `mas list`.split("\n").map { |line|
        match = line.match(/^(?<id>\d+)\s(?<name>.*)?\s\((?<version>[\d\.]+)\)$/)
        match[:id]
      }

      installed_ids.include?(id)
    end

    met? {
      installed = false

      # `mas list` takes a little while to catch up to a freshly installed app.
      # Try a few times.
      5.times do |i|
        installed = true and break if installed?
        sleep i * 2
      end

      installed
    }

    meet {
      log_shell "Installing #{name} via Mac App Store", "mas install #{id}"
    }
  }
end

dep("1Blocker.mas") { id "1107421413" }
dep("Things3.mas") { id "904280696" }
dep("Reeder.mas") { id "880001334" }
dep("Pixelmator.mas") { id "407963104" }
dep("Fantastical.mas") { id "435003921" }
dep("Tweetbot.mas") { id "557168941" }
dep("Icon Slate.mas") { id "439697913" }
dep("The Unarchiver.mas") { id "425424353" }
dep("Rested.mas") { id "421879749" }
dep("RegExRX.mas") { id "498370702" }
dep("Deckset.mas") { id "847496013" }
dep("Soulver.mas") { id "413965349" }
dep("iA Writer.mas") { id "775737590" }

# Apps installed from homebrew cask
def cask(name); dep name, :template => "icelab:cask"; end # Avoid repitition below

cask "1password"
cask "charles"
cask "choosy"
cask "dash"
cask "divvy"
cask "docker"
cask "doxie"
cask "dropbox"
cask "firefox"
cask "figma"
cask "google-chrome"
cask "gpg-suite"
cask "hammerspoon"
cask "hazel"
cask "imagealpha"
cask "imageoptim"
cask "iterm2"
cask "launchbar"
cask "licecap"
cask "openemu"
cask "optimage"
cask "paw"
cask "postico"
cask "rowanj-gitx"
cask "rocket"
cask "sequel-pro"
cask "skype"
cask "slack"
cask "sketch"
cask "superduper"
cask "textexpander"
cask "transmit"
cask "virtualbox"
cask "visual-studio-code"
cask "vlc"
