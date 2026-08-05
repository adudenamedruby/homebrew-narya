class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/mozilla-mobile/fxios-ctl"
  version "20260629.0"

  depends_on "node"

  base_url = "https://github.com/mozilla-mobile/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "c650886b8c9d73acfe4a38168752c57fff5ac9344f0c29cf8f067a720913e03f"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "0b3623cde5f02b24109f61306266a481c96460b693d6d99ddba8bfd6acd5ef6f"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
