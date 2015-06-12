dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "personal"
end

dep "personal" do
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

  # SublimeLinters
  requires "sublime_linters.npm"

  # Sublime Text 3 Packages
  requires "AdvancedNewFile.subl_package"
  requires "CodeFormatter.subl_package"
  requires "CoffeeScript.subl_package"
  requires "GitGutter.subl_package"
  requires "JSConsoleSublimeSnippets.subl_package"
  requires "JSX.subl_package"
  requires "MarkdownEditing.subl_package"
  requires "PrettyJson.subl_package"
  requires "Ruby-Slim.subl_package"
  requires "SCSS.subl_package"
  requires "Sublime-Wrap-Plus.subl_package"
  requires "Sublime-JSDocs.subl_package"
  requires "SublimeLinter.subl_package"
  requires "SublimeLinter-jshint.subl_package"
  requires "SublimeLinter-jsxhint.subl_package"
  requires "SublimeLinter-ruby.subl_package"
  requires "Theme - Soda.subl_package"
  requires "TomDoc.subl_package"
  requires "TrailingSpaces.subl_package"

  # Sketch Plugins
  requires "Content-generator-sketch-plugin.sketch_plugin"
  requires "Sketch-Notebook.sketch_plugin"
  requires "Makzan-Sketch-Plugin-Scripts.sketch_plugin"
  requires "select-group-layers-sketch-plugin.sketch_plugin"
end
