cask "dirty-tape" do
  version "2.6.38"
  sha256 "b71401653b0abec4cf6201a867b4d835c02b9d2e855a342e10df4200a26ac5cb"

  url "https://softubestorage.b-cdn.net/stable/release-arch-enemy-2/Softube%20Dirty%20Tape%20Installer%20#{version}%2002148737.pkg",
      verified: "softubestorage.b-cdn.net/"
  name "Softube Dirty Tape"
  desc "Softube lo-fi tape distortion and saturation plugin (VST/VST3/AU/AAX)"
  homepage "https://www.softube.com/plug-ins/dirty-tape"

  livecheck do
    skip "Softube's download URL embeds a release-specific build suffix (02148737) " \
         "alongside the version; bump both manually on new releases"
  end

  depends_on macos: :monterey

  pkg "Softube Dirty Tape Installer #{version} 02148737.pkg"

  uninstall pkgutil: "com.softube.pkg.PlugIns_Dirty_Tape"

  zap trash: "~/Documents/Studio One/Presets/Softube/Dirty Tape"
end
