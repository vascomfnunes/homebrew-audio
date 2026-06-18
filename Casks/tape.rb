cask "tape" do
  version "2.6.38"
  sha256 "29dda2698cb24b1ec507b05f81795cd2406e8bb7aec972164539a3b29301c8ed"

  url "https://softubestorage.b-cdn.net/stable/release-arch-enemy-2/Softube%20Tape%20Installer%20#{version}%2002148737.pkg",
      verified: "softubestorage.b-cdn.net/"
  name "Softube Tape"
  desc "Softube analog tape machine emulation plugin (VST/VST3/AU/AAX)"
  homepage "https://www.softube.com/plug-ins/tape"

  livecheck do
    skip "Softube's download URL embeds a release-specific build suffix (02148737) " \
         "alongside the version; bump both manually on new releases"
  end

  depends_on macos: :monterey

  pkg "Softube Tape Installer #{version} 02148737.pkg"

  uninstall pkgutil: "com.softube.pkg.PlugIns_Tape"

  zap trash: [
    "~/Documents/Studio One/Presets/Softube/Tape Multi Track",
    "~/Documents/Studio One/Presets/Softube/Tape",
  ]
end
