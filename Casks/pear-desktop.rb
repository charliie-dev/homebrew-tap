cask "pear-desktop" do
  arch arm: "-arm64"

  version "3.12.0"
  sha256 arm:   "1266b1efdf3cd22276b989445ea14f0afd6bc751c26fc0983f24dd527be2f724",
         intel: "76e4a859cfbb777ca4383f83455a4ee01a8345356b86f0a91395b9e7dda6a863"

  url "https://github.com/pear-devs/pear-desktop/releases/download/v#{version}/YouTube-Music-#{version}#{arch}.dmg"
  name "Pear Desktop"
  desc "YouTube Music desktop app with custom plugins"
  homepage "https://github.com/pear-devs/pear-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "YouTube Music.app"

  # Upstream ships an ad-hoc signed build, so Gatekeeper rejects it while quarantined.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/YouTube Music.app"]
  end

  zap trash: [
    "~/Library/Application Support/YouTube Music",
    "~/Library/Caches/com.github.th-ch.youtube-music",
    "~/Library/Caches/com.github.th-ch.youtube-music.ShipIt",
    "~/Library/HTTPStorages/com.github.th-ch.youtube-music",
    "~/Library/Preferences/com.github.th-ch.youtube-music.plist",
    "~/Library/Saved Application State/com.github.th-ch.youtube-music.savedState",
  ]
end
