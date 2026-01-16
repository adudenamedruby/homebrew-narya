class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "0.3.1"

  depends_on "swiftlint"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/adudenamedruby/narya/releases/download/v0.3.1/narya-v0.3.1-macos-arm64.tar.gz"
      sha256 "63b8506219f31b499ff9ee8be8f7acd9b9786c9200515b0f0e814ae914c3df2c"
    else
      url "https://github.com/adudenamedruby/narya/releases/download/v0.3.1/narya-v0.3.1-macos-x86_64.tar.gz"
      sha256 "679061607c56ed5a5ab482ca9b68ee3f6862334b9057a51354d823e50b6af0fe"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal "0.3.1", shell_output("#{bin}/narya --version").strip
  end
end
