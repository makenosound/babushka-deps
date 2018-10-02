dep "apps" do
  # Disable mas
  # https://github.com/mas-cli/mas/issues/164
  # requires "mac app store apps"
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


dep "homebrew cask apps" do
 requires "1password"
 requires "backblaze"
 requires "charles"
 requires "choosy"
 requires "dash"
 requires "divvy"
 requires "docker"
 requires "doxie"
 requires "dropbox"
 requires "firefox"
 requires "figma"
 requires "fluid"
 requires "google-chrome"
 requires "gpg-suite"
 requires "hammerspoon"
 requires "hazel"
 requires "imagealpha"
 requires "imageoptim"
 requires "insomnia"
 requires "iterm2"
 requires "java"
 requires "karabiner-elements"
 requires "launchbar"
 requires "licecap"
 requires "openemu"
 requires "optimage"
 requires "paw"
 requires "postico"
 requires "rowanj-gitx"
 requires "rocket"
 requires "sequel-pro"
 requires "skype"
 requires "slack"
 requires "sketch"
 requires "sublime-merge"
 requires "superduper"
 requires "textexpander"
 requires "transmit"
 requires "turbo-boost-switcher"
 # requires "virtualbox"
 requires "visual-studio-code"
 requires "vlc"
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
def cask(name); dep name, :template => "icelab:cask"; end # Avoid repetition below

cask "1password"
cask "backblaze"
cask "charles"
cask "choosy"
cask "dash"
cask "divvy"
cask "docker"
cask "doxie"
cask "dropbox"
cask "firefox"
cask "figma"
cask "fluid"
cask "google-chrome"
cask "gpg-suite"
cask "hammerspoon"
cask "hazel"
cask "imagealpha"
cask "imageoptim"
cask "insomnia"
cask "iterm2"
cask "java"
cask "karabiner-elements"
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
dep "sublime-merge.cask", :template => "icelab:cask" do
  installs "sublime-merge"
end
dep "sublime-merge" do
  requires \
    "sublime-merge.cask",
    "smerge bin symlinked"
end
cask "superduper"
cask "textexpander"
cask "transmit"
cask "turbo-boost-switcher"
cask "virtualbox"
cask "visual-studio-code"
cask "vlc"

dep "smerge bin symlinked" do
  met? {
    "/usr/local/bin/smerge".p.exists?
  }

  meet {
    shell! "ln -s '/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge' /usr/local/bin"
  }
end