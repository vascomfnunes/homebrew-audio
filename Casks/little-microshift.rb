cask "little-microshift" do
  version "5.5.5.19885"
  sha256 "15d384e31f9272729d7fa2332efdaa2c52c3f004e9701afc2acbccf58a4bf48a"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/LittleMicroShift5_#{version}.dmg"
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
