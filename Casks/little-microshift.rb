cask "little-microshift" do
  version "5.5.4.18982"
  sha256 "7fb184baa7bac4afe1f8e70a1b17bac194cdcb8e04c2516ff8909fb42177f48d"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/LittleMicroShift5_#{version}.dmg",
      verified: "storage.googleapis.com/soundtoys-download/"
  name "Soundtoys Little MicroShift"
  desc "Soundtoys stereo-widening pitch-shifting plugin (VST/VST3/AU/AAX)"
  homepage "https://www.soundtoys.com/product/little-microshift/"

  livecheck do
    skip "Soundtoys' download URL embeds the full build version in the path; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "Install Little MicroShift.pkg"

  uninstall pkgutil: /com\.soundtoys\.LittleMicroShift5\..*/

  zap trash: "~/Library/Preferences/com.soundtoys.littlemicroshift.plist"
end
