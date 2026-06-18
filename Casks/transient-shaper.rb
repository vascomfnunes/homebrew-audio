cask "transient-shaper" do
  version "2.6.38"
  sha256 "284879e6e86edd36e25fe5ade44adab444172086bf75fbfdc858f5b2b108bb6f"

  url "https://softubestorage.b-cdn.net/stable/release-arch-enemy-2/Softube%20Transient%20Shaper%20Installer%20#{version}%2002148737.pkg",
      verified: "softubestorage.b-cdn.net/"
  name "Softube Transient Shaper"
  desc "Softube dual-band attack/decay shaping plugin (VST/VST3/AU/AAX)"
  homepage "https://www.softube.com/us/plug-ins/transient-shaper"

  livecheck do
    skip "Softube's download URL embeds a release-specific build suffix (02148737) " \
         "alongside the version; bump both manually on new releases"
  end

  depends_on macos: :monterey

  pkg "Softube Transient Shaper Installer #{version} 02148737.pkg"

  uninstall pkgutil: "com.softube.pkg.PlugIns_Transient_Shaper"

  zap trash: "~/Documents/Studio One/Presets/Softube/Transient Shaper"
end
