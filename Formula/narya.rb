class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "20260117.0"

  depends_on "swiftlint"

  base_url = "https://github.com/adudenamedruby/narya/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/narya-v#{version}-macos-arm64.tar.gz"
      sha256 "a762dd1ffefc05f523afd718041e6807e95bc508b8a326c7620f88bcc4017200"
    else
      url "#{base_url}/narya-v#{version}-macos-x86_64.tar.gz"
      sha256 "7b0272c1b19ba8a7449d782e845f60018b1d6d9fabd2d698631f913418e7f10d"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/narya --version").strip
  end
end
