class Cookcli < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/cookcli/archive/refs/tags/v0.10.0.tar.gz"
  sha256 "6832191a18e4e4a2d9f5e3227631b7c598d239f01f0560bc226cc3ef3948194b"
  license "MIT"

  depends_on "node" => :build
  depends_on "rust" => :build

  def install
    cd "ui" do
      system "npm", "install", *std_npm_args(prefix: false)
      system "npm", "run", "build"
    end
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"cook", "version"
  end
end
