cask "clipper" do
  version "2.6.38"
  sha256 "28e7a26a28ad3376a7c5ee213218833378f53fdd950601344b2cdf91d7bcbfc8"

  url "https://softubestorage.b-cdn.net/stable/release-arch-enemy-2/Softube%20Clipper%20Installer%20#{version}%2002148737.pkg",
      verified: "softubestorage.b-cdn.net/"
  name "Softube Clipper"
  desc "Softube peak-clipping plugin for mixing and mastering (VST/VST3/AU/AAX)"
  homepage "https://www.softube.com/plug-ins/clipper"

  livecheck do
    skip "Softube's download URL embeds a release-specific build suffix (02148737) " \
         "alongside the version; bump both manually on new releases"
  end

  depends_on macos: :monterey

  pkg "Softube Clipper Installer #{version} 02148737.pkg"

  uninstall pkgutil: "com.softube.pkg.PlugIns_Clipper"

  zap trash: "~/Documents/Studio One/Presets/Softube/Clipper"
end
