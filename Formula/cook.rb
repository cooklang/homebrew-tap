class Cook < Formula
  desc "CLI tool for CookLang Recipe Markup Language"
  homepage "https://cooklang.org"
  url "https://github.com/cooklang/CookCLI.git", tag: "v0.0.9"
  license "MIT"

  head "https://github.com/cooklang/CookCLI.git", branch: "main"

  depends_on xcode: ["10.0", :build]

  patch :DATA

  def install
    system "make", "build_macos"
    bin.install ".build/#{ENV["HOMEBREW_PROCESSOR"]}-apple-macosx/release/cook"
  end

  test { system "#{bin}/cook", "version" }
end

__END__
diff --git a/Makefile b/Makefile
index 46f905d..ceabce1 100644
--- a/Makefile
+++ b/Makefile
@@ -35,7 +35,7 @@ smoketest_linux:
 
 
 build_macos:
-	swift build --configuration release  --static-swift-stdlib
+	swift build --configuration release --disable-sandbox
 
 archive_macos:
 	cd .build/x86_64-apple-macosx/release/ && zip "CookCLI_$(VERSION)_darwin_amd64.zip" cook

