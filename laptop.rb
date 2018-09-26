dep "laptop bootstrapped" do
  requires "icelab:workstation bootstrapped"
end

dep "laptop" do
  # Build the standard Icelab environment
  requires "icelab:workstation"

  requires "personal"
end

dep "personal" do
  requires "personal dotfiles"
  requires "macos configured"
  requires "packages"
  requires "apps"
  requires "vscode extensions"
end
