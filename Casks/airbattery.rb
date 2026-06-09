cask "airbattery" do
  version "1.6.3"
  sha256 "724a38540195eb5490d320f3fe4a0d687b936b2f466bd094243b4b1e6045d88e"

  url "https://github.com/lihaoyun6/AirBattery/releases/download/#{version}/AirBattery_v#{version}.dmg",
      verified: "github.com/lihaoyun6/AirBattery/"
  name "AirBattery"
  desc "Display the battery levels of connected devices"
  homepage "https://lihaoyun6.github.io/airbattery/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :big_sur

  app "AirBattery.app"

  caveats <<~EOS
    AirBattery's upstream release is not signed with a Developer ID certificate.

    To unquarantine the app with Sentinel:
      brew install --cask alienator88-sentinel

    Then open AirBattery.app with Sentinel. Do not self-sign AirBattery:
    doing so removes entitlements required by its Widget Extension.
  EOS
end
