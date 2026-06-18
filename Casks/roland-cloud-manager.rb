cask "roland-cloud-manager" do
  version "3.1.22"
  sha256 "4b7059c9614d8614abaf61bc21e2752f00065e762c35290da3feef4eed9499c0"

  url "https://www.rolandcloud.com/getmedia/e296bdfb-e275-4794-9d86-1c4efecfd9ba/RolandCloudManager-#{version.tr(".", "-")}-Universal.dmg?ext=.dmg"
  name "Roland Cloud Manager"
  desc "Manager for installing and updating Roland Cloud instruments and effects"
  homepage "https://www.rolandcloud.com/"

  livecheck do
    skip "Roland's CDN URL embeds a fixed media GUID; bump manually on new releases"
  end

  installer manual: "Roland Cloud Manager Installer.app"

  uninstall launchctl: "com.roland.rcmservice",
            quit:       "com.roland.cloudmanagercore",
            delete:     "/Applications/Roland Cloud Manager.app"

  zap trash: [
    "~/Library/Application Support/Roland Cloud",
    "~/Library/Caches/Roland Cloud",
    "~/Library/Preferences/com.roland.cloudmanagercore.plist",
    "~/Library/LaunchAgents/com.roland.rcmservice.plist",
  ]
end
