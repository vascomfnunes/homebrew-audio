cask "phasemistress" do
  version "5.5.4.18982"
  sha256 "22b0fccff1304490cbe43d7f146d1a6e2da6a49de3c38b350f8a274909785422"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/PhaseMistress5_#{version}.dmg",
      verified: "storage.googleapis.com/soundtoys-download/"
  name "Soundtoys PhaseMistress"
  desc "Soundtoys analog-modeled phaser plugin (VST/VST3/AU/AAX)"
  homepage "https://www.soundtoys.com/product/phasemistress/"

  livecheck do
    skip "Soundtoys' download URL embeds the full build version in the path; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "Install PhaseMistress.pkg"

  uninstall pkgutil: /com\.soundtoys\.PhaseMistress5\..*/

  zap trash: "~/Library/Preferences/com.soundtoys.phasemistress.plist"
end
