class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/mozilla-mobile/fxios-ctl"
  version "20260305.0"

  depends_on "swiftlint"
  depends_on "node"

  base_url = "https://github.com/mozilla-mobile/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "4d6ab421ca7ada33aa5b5fc054ad2a5fd587ad77a472d8603a0059d938f74c6c"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "8c72e2748d754d2ef4ebd5481d6e9f5b60caf2be7586fbbff5ed3fae3c41913e"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
