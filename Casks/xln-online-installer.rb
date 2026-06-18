cask "xln-online-installer" do
  version "4.4.0"
  sha256 "3e90521723a288664354baf2e9e4214b21e661b9ff152658155f7407e0d4b533"

  url "https://xlnaudio.s3.amazonaws.com/products/XLN%20Online%20Installer/#{version.tr(".", "_")}%20Release9/downloadables/XLN%20Online%20Installer.dmg",
      verified: "xlnaudio.s3.amazonaws.com/products/"
  name "XLN Online Installer"
  desc "Manager for installing and updating XLN Audio products"
  homepage "https://www.xlnaudio.com/"

  livecheck do
    skip "XLN's download API (https://www.xlnaudio.com/api/download/96) redirects " \
         "here, but its Location header contains unencoded spaces that break " \
         "Homebrew's URI parser, so the resolved, percent-encoded S3 URL is used " \
         "directly. Bump manually on new releases."
  end

  auto_updates true

  app "XLN Online Installer.app"

  uninstall quit:   "com.xlnaudio.xlnonlineinstaller",
            delete: "/Applications/XLN Online Installer.app"

  zap trash: [
    "~/Library/Application Support/XLN Online Installer",
    "~/Library/Preferences/ByHost/com.xlnaudio.xlnonlineinstaller.*.plist",
    "~/Library/Preferences/ByHost/com.xlnaudio.life.*.plist",
    "~/Library/Caches/com.juce.locks/XLN",
    "~/Library/Caches/com.juce.locks/XLN_Process",
  ]
end
