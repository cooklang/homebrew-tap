class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.0.11"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  bottle do
    root_url "https://github.com/cooklang/homebrew-tap/releases/download/cook-0.0.11"
    sha256 cellar: :any_skip_relocation, big_sur:     "8b4780f8bcedf64e31e3eff64788d4ec8637e22dc9894f2ebd4fc5732ecc1471"
    sha256 cellar: :any_skip_relocation, catalina:    "8b4780f8bcedf64e31e3eff64788d4ec8637e22dc9894f2ebd4fc5732ecc1471"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
