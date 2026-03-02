class ClaudeUsageBar < Formula
  desc "macOS menu bar app for real-time Claude API usage monitoring"
  homepage "https://github.com/duaghwns/ClaudeUsageBar"
  url "https://github.com/duaghwns/ClaudeUsageBar/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "12f3fd1870f41ec659d19937d474e21daa81bc0154cead399f1a95c2ffd4148f"
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
