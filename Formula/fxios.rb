class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/mozilla-mobile/fxios-ctl"
  version "20260805.0"

  depends_on "node"

  base_url = "https://github.com/mozilla-mobile/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "7c3561d4f0efaf402d9290ab606ad3688a6b41f9932d3c06003315f03d1b97bd"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "87db621cefeb0663dde40ecec56737323fb23243e98ae8a9e34bf065b68483f1"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
