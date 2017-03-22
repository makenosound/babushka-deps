dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  # Require personal deps from below
  requires "personal"
end

dep "personal" do
  requires "personal dotfiles"

  # Packages
  requires "wget.managed"

  # Apps
  requires "1password"
  requires "charles"
  requires "dash"
  requires "doxie"
  requires "firefox"
  requires "firefoxdeveloperedition"
  requires "google-chrome"
  requires "handbrake"
  requires "hazel"
  requires "imageoptim"
  requires "iterm2"
  requires "launchbar"
  requires "licecap"
  requires "mailplane"
  requires "postico"
  requires "rowanj-gitx"
  requires "skype"
  requires "slack"
  requires "sublime-text"
  requires "superduper"
  requires "textexpander"
  requires "tokens"
  requires "transmit"
  requires "virtualbox"
  requires "visual-studio-code"
  requires "vlc"

  # VS Code extensions
  requires "vscode extensions"

  # NPM packages
  # SublimeLinters
  requires "sublime_linters.npm"

  # Sublime Text 3 Packages
  requires "AdvancedNewFile.subl_package"
  requires "Babel.subl_package"
  requires "CodeFormatter.subl_package"
  requires "CoffeeScript.subl_package"
  requires "CSS3.subl_package"
  requires "GotoWindow.subl_package"
  requires "GitGutter.subl_package"
  requires "JSConsoleSublimeSnippets.subl_package"
  requires "JSX.subl_package"
  requires "MarkdownEditing.subl_package"
  requires "Open-Include.subl_package"
  requires "PrettyJson.subl_package"
  requires "Ruby-Slim.subl_package"
  requires "Sublime-Wrap-Plus.subl_package"
  requires "Sublime-JSDocs.subl_package"
  requires "SublimeLinter.subl_package"
  requires "SublimeLinter-eslint.subl_package"
  requires "SublimeLinter-ruby.subl_package"
  requires "Theme - Soda.subl_package"
  requires "TomDoc.subl_package"
  requires "TrailingSpaces.subl_package"
end
