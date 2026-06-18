cask "wavelab" do
  version "13.0.20"
  sha256 "cc80b5d1d5a6594987a9e35daf69849b480815e9049a67a39b63751d9f05c24d"

  url "https://download.steinberg.net/automated_updates/sda_downloads/68feaba8-808f-408d-ba07-6e8f8f204283/WaveLab_#{version}_Installer_mac.dmg"
  name "WaveLab"
  desc "Audio editing and mastering software"
  homepage "https://www.steinberg.net/wavelab/"

  livecheck do
    skip "Steinberg download links are session-specific; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "WaveLab 13.pkg"

  uninstall pkgutil: [
    "net.steinberg.WaveLab-13",
    "net.steinberg.WaveLab.vst3.wavelab1300",
    "com.steinberg.WaveLabAAX.aaxplugin.wavelab1300",
    "net.steinberg.wavelabexchange.wavelab1300",
    "com.steinberg.WaveLab130AeppScripts",
  ]

  zap trash: [
    "~/Library/Preferences/net.steinberg.WaveLab-13.plist",
    "~/Library/Caches/net.steinberg.WaveLab-13",
  ]
end
