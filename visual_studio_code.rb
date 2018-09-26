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
  CraigMaslowski.erb
  IBM.output-colorizer
  MattiasPernhult.vscode-todo
  Orta.vscode-danger
  Rubymaniac.vscode-paste-and-indent
  bajdzis.vscode-twig-pack
  castwide.solargraph
  CoenraadS.bracket-pair-colorizer
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  HookyQR.beautify
  jakelucas.code-file-nav
  jianbingfang.dupchecker
  kokororin.vscode-phpfmt
  mikestead.dotenv
  mrmlnc.vscode-scss
  neilbrayfield.php-docblocker
  neilding.language-liquid
  ow.vscode-subword-navigation
  PeterJausovec.vscode-docker
  pflannery.vscode-versionlens
  rebornix.ruby
  shardulm94.trailing-spaces
  sianglim.slim
  stkb.rewrap
  teabyii.ayu
  tonsky.theme-alabaster
  whatwedo.twig
  wmaurer.change-case
  yzhang.markdown-all-in-one
  ziyasal.vscode-open-in-github
].each do |ext|
  dep ext, :template => "code_extension"
end

dep "vscode ruby extension" do
  requires "rebornix.ruby"
  requires "castwide.solargraph"

  requires "debase.gem"
  requires "rcodetools.gem"
  requires "rubocop.gem"
  requires "ruby-debug-ide.gem"
  requires "solargraph.gem"
end
dep "debase.gem" do provides nil end
dep "rcodetools.gem" do provides nil end
dep "rubocop.gem" do provides nil end
dep "ruby-debug-ide.gem" do provides nil end
dep "solargraph.gem" do provides nil end

dep "vscode extensions" do
  extensions.each do |ext|
    requires ext
  end

  requires "vscode ruby extension"
end
