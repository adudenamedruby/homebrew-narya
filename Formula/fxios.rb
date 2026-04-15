class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/mozilla-mobile/fxios-ctl"
  version "20260415.0"

  depends_on "swiftlint"
  depends_on "node"

  base_url = "https://github.com/mozilla-mobile/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "7846ec4c3b4e469cee6159b70200c3098487a6fb50942d02974354b0fc6c0b68"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "115f1497f14b283d3740d54482e409e89023232ecac3fa46110c4e8225ad6e6a"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
