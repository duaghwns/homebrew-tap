cask "hancut" do
  version "0.1.1"
  sha256 "82fd6db49d275d748d3838db1b97a328e6b059107b533b1e1d020112753e8392"

  url "https://github.com/duaghwns/hancut-releases/releases/download/v#{version}/Hancut-macos-arm64.zip"
  name "Hancut"
  name "한컷"
  desc "Photo culling app that groups similar shots and picks the best one"
  homepage "https://github.com/duaghwns/hancut-releases"

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"
  depends_on formula: "exiftool"

  app "Hancut.app"

  # Apple 공증(notarization)을 받지 않은 앱이라, 설치 후 격리 속성을 지워 바로 열리게 한다
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Hancut.app"]
  end

  zap trash: [
    "~/Library/Application Support/Hancut",
    "~/Library/Caches/Hancut",
    "~/Library/Logs/Hancut",
    "~/Library/Preferences/com.hancut.Hancut.plist",
  ]
end
