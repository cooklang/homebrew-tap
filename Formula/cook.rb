class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.0.11"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
