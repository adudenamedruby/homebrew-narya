class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/fxios-ctl"
  version "20260205.0"

  depends_on "swiftlint"
  depends_on "licenseplist"
  depends_on "node"

  base_url = "https://github.com/adudenamedruby/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "eb80b14007095ab2fef84ac4afadc76b8104ef790a473beb75a9f8ff79e45a7b"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "97d4869f2d4c746c19f41deb44d2ad340f607aec319ea92b212707400a293342"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
