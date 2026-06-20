cask "crystallizer" do
  version "5.5.4.18982"
  sha256 "ee2d332f6c66891061ac2d07364ae78fd93407863c719e714aa59ceee144eac2"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/Crystallizer5_#{version}.dmg",
      verified: "storage.googleapis.com/soundtoys-download/"
  name "Soundtoys Crystallizer"
  desc "Soundtoys granular echo and reverse pitch-shifting plugin (VST/VST3/AU/AAX)"
  homepage "https://www.soundtoys.com/product/crystallizer/"

  livecheck do
    skip "Soundtoys' download URL embeds the full build version in the path; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "Install Crystallizer.pkg"

  uninstall pkgutil: /com\.soundtoys\.Crystallizer5\..*/

  zap trash: "~/Library/Preferences/com.soundtoys.crystallizer.plist"
end
