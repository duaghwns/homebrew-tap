class ClaudeUsageBar < Formula
  desc "macOS menu bar app for real-time Claude API usage monitoring"
  homepage "https://github.com/duaghwns/ClaudeUsageBar"
  url "https://github.com/duaghwns/ClaudeUsageBar/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0f5c776ea61c7135de912cfd68908a5c7c449f975d0a5a494ee91d5a28da16e1"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on macos: :ventura

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/ClaudeUsageBar"

    # Copy icon resource next to binary
    resource_bundle = Dir[".build/release/ClaudeUsageBar_ClaudeUsageBar.bundle"].first
    if resource_bundle
      (bin/"ClaudeUsageBar_ClaudeUsageBar.bundle").install Dir["#{resource_bundle}/*"]
    end
  end

  def caveats
    <<~EOS
      Claude Code CLI must be installed and logged in:
        npm install -g @anthropic-ai/claude-code
        claude login
    EOS
  end
end
