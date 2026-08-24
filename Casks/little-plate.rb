cask "little-plate" do
  version "5.5.5.19885"
  sha256 "7be4d7b756d92d0e7a88c69543e636876b7732f3442ab313703115236c83e687"

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
