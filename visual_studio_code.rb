meta :code_extension do
  accepts_value_for :name, :basename

  template {
    requires "visual-studio-code"

    met? {
      shell("code --list-extensions").split("\n").grep(basename).any?
    }

    meet {
      shell! "code", "--install-extension", basename
    }
  }
end

extensions = %w[
  2gua.rainbow-brackets
  HookyQR.beautify
  IBM.output-colorizer
  jakelucas.code-file-nav
  Orta.vscode-danger
  ow.vscode-subword-navigation
  Rubymaniac.vscode-paste-and-indent
  rebornix.Ruby
  ryu1kn.annotator
  sianglim.slim
  steve8708.Align
  wmaurer.change-case
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "vscode ruby extension" do
  requires "rebornix.Ruby"

  requires "debase.gem"
  requires "rcodetools.gem"
  requires "rubocop.gem"
  requires "ruby-debug-ide.gem"
end
dep "debase.gem" do provides nil end
dep "rcodetools.gem" do provides nil end
dep "rubocop.gem" do provides nil end
dep "ruby-debug-ide.gem" do provides nil end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "vscode ruby extension"
end
