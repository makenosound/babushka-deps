dep "personal dotfiles" do
  requires "icelab:dotfiles"
  requires "icelab:repository".with  path: "~/.dotfiles-personal",
                              url: "https://github.com/makenosound/dotfiles.git",
                              branch: "master"

  met? {
    "~/.dotfiles-personal".p.exists?
  }

  after {
    shell "rcup"
  }
end
