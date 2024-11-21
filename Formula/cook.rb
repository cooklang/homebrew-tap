class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.8.0"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  bottle do
    root_url "https://github.com/cooklang/homebrew-tap/releases/download/cook-0.8.0"
    sha256 cellar: :any_skip_relocation, big_sur: "03ea668e1aa01eb30dd09e05be6bda59c3c9423e6a460a0a4b3321fd339ad11c"
  end

  depends_on xcode: ["10.0", :build]

  def install
    system "swift", "build", "--configuration", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/cook"
  end

  test { system "#{bin}/cook", "version" }
end
