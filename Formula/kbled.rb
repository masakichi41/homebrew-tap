class Kbled < Formula
  desc "Control the built-in keyboard CapsLock LED on macOS"
  homepage "https://github.com/masakichi41/kbled"
  url "https://github.com/masakichi41/kbled/releases/download/v0.2.1/kbled-0.2.1.zip"
  sha256 "d4eaad2444a84b4b294788092c6ddff421546e1f654b5882e3e6a7b5c77bf016"
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
