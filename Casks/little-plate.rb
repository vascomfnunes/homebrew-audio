cask "little-plate" do
  version "5.5.4.18982"
  sha256 "1fc2e1a6819ff3255dd18bddf47ebf1ba589d6d85a1710de9b5b950932e1771d"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/LittlePlate5_#{version}.dmg",
      verified: "storage.googleapis.com/soundtoys-download/"
  name "Soundtoys Little Plate"
  desc "Soundtoys EMT 140 plate reverb plugin (VST/VST3/AU/AAX)"
  homepage "https://www.soundtoys.com/product/little-plate/"

  livecheck do
    skip "Soundtoys' download URL embeds the full build version in the path; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "Install Little Plate.pkg"

  uninstall pkgutil: /com\.soundtoys\.LittlePlate5\..*/

  zap trash: "~/Library/Preferences/com.soundtoys.littleplate.plist"
end
