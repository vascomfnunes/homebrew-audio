cask "echoboy" do
  version "5.5.4.18982"
  sha256 "c50cbeea56e66ea5420dd6ed311dca01712e2ff79faaccadd6e7c9cccae22de9"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/EchoBoy5_#{version}.dmg",
      verified: "storage.googleapis.com/soundtoys-download/"
  name "Soundtoys EchoBoy"
  desc "Soundtoys echo and delay plugin (VST/VST3/AU/AAX)"
  homepage "https://www.soundtoys.com/product/echoboy/"

  livecheck do
    skip "Soundtoys' download URL embeds the full build version in the path; bump manually on new releases"
  end

  depends_on macos: :big_sur

  pkg "Install EchoBoy.pkg"

  uninstall pkgutil: /com\.soundtoys\.EchoBoy5\..*/

  zap trash: "~/Library/Preferences/com.soundtoys.echoboy.plist"
end
