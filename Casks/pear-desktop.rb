cask "pear-desktop" do
  arch arm: "-arm64"

  version "3.12.1"
  sha256 arm:   "81392bd1e1dfe56befa7373c4b0a31fe8972cc6bb36edc55aa923dde183bce78",
         intel: "573021f8fd8c9fad4c38b65d17de007f6a973ada66aa931a03d8bc028b009ee9"

  url "https://github.com/pear-devs/pear-desktop/releases/download/v#{version}/YouTube-Music-#{version}#{arch}.dmg"
  name "Pear Desktop"
  desc "YouTube Music desktop app with custom plugins"
  homepage "https://github.com/pear-devs/pear-desktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

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
