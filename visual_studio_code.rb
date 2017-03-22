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
  CraigMaslowski.erb
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  HookyQR.beautify
  IBM.output-colorizer
  jakelucas.code-file-nav
  MattiasPernhult.vscode-todo
  miguel-savignano.ruby-symbols
  mrmlnc.vscode-scss
  Orta.vscode-danger
  ow.vscode-subword-navigation
  PeterJausovec.vscode-docker
  rebornix.Ruby
  Rubymaniac.vscode-paste-and-indent
  ryu1kn.annotator
  shardulm94.trailing-spaces
  sianglim.slim
  steve8708.Align
  stkb.rewrap
  vilicvane.es-quotes
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
