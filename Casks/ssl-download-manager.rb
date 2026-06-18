cask "ssl-download-manager" do
  version "1.6.10"
  sha256 "e56832df5bc61ba642ec24546ecf961522cd603e621225457fbc01141e558417"

  url "https://softwareupdate.solidstatelogic.com/DownloadManager/appReleases/latest/SSL%20Download%20Manager-#{version}-universal.dmg"
  name "SSL Download Manager"
  desc "Manager for installing and updating Solid State Logic plugins"
  homepage "https://www.solidstatelogic.com/"

  livecheck do
    skip "SSL serves the latest installer from a fixed 'latest' path; bump manually on new releases"
  end

  depends_on macos: :monterey

  app "SSL Download Manager.app"

  uninstall launchctl: "com.solidstatelogic.analytics",
            quit:       "com.solidstatelogic.downloadmanager",
            delete:     "/Applications/SSL Download Manager.app"

  zap trash: [
    "~/Library/Application Support/SSL Download Manager",
    "~/Library/Preferences/com.solidstatelogic.downloadmanager.plist",
    "~/Library/LaunchAgents/com.solidstatelogic.analytics.plist",
    "~/Library/Logs/SSL Download Manager",
  ]
end
