cask "phasemistress" do
  version "5.5.5.19885"
  sha256 "65d9d139dbd365d24558a26a9c74f0617e0c7e57455bd52d740e4e3ed4c4707e"

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
