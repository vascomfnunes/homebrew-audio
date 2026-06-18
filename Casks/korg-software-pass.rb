cask "korg-software-pass" do
  version "1.3.16"
  sha256 "01edca868238793752b0794528826663c7cee7c898fc544d1c4adb87c5953cef"

  url "https://storage.korg.com/korgms/korg_collection/mac/KORG_Software_Pass_#{version.gsub(".", "_")}.dmg"
  name "KORG Software Pass"
  desc "Manager for activating and updating KORG software products"
  homepage "https://id.korg.com/redirect/korg-software-pass/mac"

  livecheck do
    skip "KORG ships a fixed redirect URL that always serves the latest version; bump manually"
  end

  pkg "KORG_Software_Pass Installer.pkg"

  uninstall pkgutil: "jp.co.korg.pkg.korgsoftwarepass",
            delete:  "/Applications/KORG/KORG Software Pass.app"

  zap trash: [
    "~/Library/Caches/jp.co.korg.klchub",
    "~/Library/HTTPStorages/jp.co.korg.klchub",
    "~/Library/Caches/com.juce.locks/juceAppLock_KORG Software Pass",
  ]
end
