class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.1.1"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  bottle do
    root_url "https://github.com/cooklang/homebrew-tap/releases/download/cook-0.1.1"
    sha256 cellar: :any_skip_relocation, catalina: "affab81382acfb1b2dcd3be4982f96ab7f7be9a8a3f68feb1454881f47d1435d"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
