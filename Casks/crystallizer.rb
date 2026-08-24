cask "crystallizer" do
  version "5.5.5.19885"
  sha256 "560f0479508a7624a0963767517db1c242398119f16d0f1228a2ffaf0957643c"

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
