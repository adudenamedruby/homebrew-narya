class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/mozilla-mobile/fxios-ctl"
  version "20260213.0"

  depends_on "swiftlint"
  depends_on "node"

  base_url = "https://github.com/mozilla-mobile/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "64365c2756a7b5600ae591c562a53c9cd7cbdb89b65a116ea0cfb7478a61eeae"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "7b2522a3172c0003620c33577881dbd0e33af39bcc1032d7f342cae7305d5bf8"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
