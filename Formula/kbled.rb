class Kbled < Formula
  desc "Control the built-in keyboard CapsLock LED on macOS"
  homepage "https://github.com/masakichi41/kbled"
  url "https://github.com/masakichi41/kbled/releases/download/v0.2.0/kbled-0.2.0.zip"
  sha256 "8a24be62ca4e0a0827a657ea11befdbb08e81dcef93bc29bbf3ce8797ca5ce0e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "kbled", "ccled"
  end

  def caveats
    <<~S
      kbled and ccled require the Input Monitoring permission:
        System Settings > Privacy & Security > Input Monitoring
    S
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kbled -V")
  end
end
