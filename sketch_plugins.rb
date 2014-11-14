meta :sketch_plugin do
  accepts_value_for :name, :basename
  accepts_value_for :source
  accepts_value_for :branch, "master"

  def package_name
    basename.sub(/\.sketch_plugin$/, "")
  end

  def path
    "~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins" / package_name
  end

  template {
    # requires "sketch"

    # Wrap requires in setup block, when parameters are available
    setup {
      requires "icelab:repository".with :path => path,
                                        :url => source,
                                        :branch => branch
    }
  }
end

def sketch(name, &block) dep name, {:template => "sketch_plugin"}, &block end # Avoid repetition below

sketch "Content-generator-sketch-plugin.sketch_plugin" do
  source "https://github.com/timuric/Content-generator-sketch-plugin.git"
end

sketch "Sketch-Notebook.sketch_plugin" do
  source "https://github.com/marcosvidal/Sketch-Notebook.git"
end

sketch "Makzan-Sketch-Plugin-Scripts.sketch_plugin" do
  source "https://github.com/makzan/Sketch-Plugin-Scripts.git"
end

sketch "select-group-layers-sketch-plugin.sketch_plugin" do
  source "https://github.com/mattmcmanus/select-group-layers-sketch-plugin.git"
end
