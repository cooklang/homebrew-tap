class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.0.13"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  bottle do
    root_url "https://github.com/cooklang/homebrew-tap/releases/download/cook-0.0.13"
    sha256 cellar: :any_skip_relocation, catalina: "c70988b0d8ee784c56987e31235fb67157b84f4d623e036e658014af2d5c3ec3"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
