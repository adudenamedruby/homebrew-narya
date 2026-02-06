class Fxios < Formula
  desc "CLI tool for managing firefox-ios"
  homepage "https://github.com/adudenamedruby/fxios-ctl"
  version "20260206.1"

  depends_on "swiftlint"
  depends_on "node"

  base_url = "https://github.com/adudenamedruby/fxios-ctl/releases/download/v#{version}"

  on_macos do
    if Hardware::CPU.arm?
      url "#{base_url}/fxios-v#{version}-macos-arm64.tar.gz"
      sha256 "785f402bbb94d950952b94794861aa3fa1bd242d8a79023b862c17ac32a53ae8"
    else
      url "#{base_url}/fxios-v#{version}-macos-x86_64.tar.gz"
      sha256 "fe65dd892f9dea4ca4a35415ebfc152a3cef4807a0507704f6f68aa60c03af99"
    end
  end

  def install
    bin.install "fxios"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/fxios --version").strip
  end
end
