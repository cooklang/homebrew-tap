class Cookcli < Formula
  desc "CLI tool to create shopping lists and maintain recipes"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/cookcli/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "050fcbd7f8f938bd6ffc898a403795101807cfa6d76c787e991c8d90031405c6"
  license "MIT"

  depends_on "node" => :build
  depends_on "rust" => :build

  def install
    cd "ui" do
      # rubocop:disable FormulaAudit/StdNpmArgs
      system "npm", "install" # rubocop:disable FormulaAudit/StdNpmArgs
      # rubocop:enable FormulaAudit/StdNpmArgs
      system "npm", "run", "build"
    end
    system "cargo", "install", *std_cargo_args
  end

  test do
    system bin/"cook", "version"
  end
end
