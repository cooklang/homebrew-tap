class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.0.13"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  bottle do
    root_url "https://github.com/cooklang/homebrew-tap/releases/download/cook-0.0.12"
    sha256 cellar: :any_skip_relocation, catalina: "a1c166bff5d4cf0c9e4b4cdf9882296caaaa4d46dd04f993012381389f3173ed"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
