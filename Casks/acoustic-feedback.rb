cask "acoustic-feedback" do
  version "2.6.38"
  sha256 "200de88f603fe69ae10dbc3e9d9ab73db8525daddc74182ccc24160b8511cb9f"

  url "https://softubestorage.b-cdn.net/stable/release-arch-enemy-2/Softube%20Acoustic%20Feedback%20Installer%20#{version}%2002148737.pkg",
      verified: "softubestorage.b-cdn.net/"
  name "Softube Acoustic Feedback"
  desc "Softube guitar feedback simulation plugin (VST/VST3/AU/AAX)"
  homepage "https://www.softube.com/us/plug-ins/acoustic-feedback"

  livecheck do
    skip "Softube's download URL embeds a release-specific build suffix (02148737) " \
         "alongside the version; bump both manually on new releases"
  end

  depends_on macos: :monterey

  pkg "Softube Acoustic Feedback Installer #{version} 02148737.pkg"

  uninstall pkgutil: "com.softube.pkg.PlugIns_Acoustic_Feedback"

  zap trash: "~/Documents/Studio One/Presets/Softube/Acoustic Feedback"
end
