cask "echoboy" do
  version "5.5.5.19885"
  sha256 "f1d37a03fdf3fc9fecdb462d0ac5a6a5faae19f27e6b934275a9e7adbbccf344"

  url "https://storage.googleapis.com/soundtoys-download/versions/version_#{version.dots_to_underscores}/EchoBoy5_#{version}.dmg"
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
