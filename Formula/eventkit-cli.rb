class EventkitCli < Formula
  desc "JSON-only CLI for Apple Reminders and Calendar, built for AI agents"
  homepage "https://github.com/masakichi41/eventkit-cli"
  url "https://github.com/masakichi41/eventkit-cli/releases/download/v0.1.0/eventkit-cli-0.1.0.zip"
  sha256 "c6e0ba1181fc0c0a4ad249f9265f1e3b34c2f6b261814ac02f9b465e52a3b10f"
  license "MIT"

  depends_on macos: :ventura

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "eventkit"
  end

  def caveats
    <<~S
      eventkit needs Calendars / Reminders access. macOS grants it to the
      app that launches eventkit (Terminal, iTerm2, Ghostty, ...), not to
      eventkit itself. Run these once from that app to show the dialogs:
        eventkit calendar list
        eventkit reminder-list list
      If denied, enable that app in System Settings > Privacy & Security.

      To register the agent skill (pick one per agent):
        Claude Code:
          claude plugin marketplace add masakichi41/eventkit-cli
          claude plugin install eventkit-cli@eventkit-cli
        Other agents (including OpenClaw):
          npx skills add masakichi41/eventkit-cli
      See the README for details.
    S
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/eventkit --version")
  end
end
