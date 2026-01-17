class Narya < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/narya"
  version "20260116.5"

  depends_on "swiftlint"

  base_url = "https://github.com/adudenamedruby/narya/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/narya-v#{version}-macos-arm64.tar.gz"
      sha256 "6839313babf309fddeca51b4ef5a8ea0ae2e775b65068d108ab9c1e5a4aa5e5f"
    else
      url "#{base_url}/narya-v#{version}-macos-x86_64.tar.gz"
      sha256 "c6296d2ae82640e1f010eb76734c9210ce6ec0f59ec54ae95625da946fb797c9"
    end
  end

  def install
    bin.install "narya"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/narya --version").strip
  end
end
