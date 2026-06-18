cask "blackhole-immersive" do
  version "1.4.4"
  sha256 "4961ec5b8cbd38d001d65c3c3e196846e6a37d02c09ccb0691e17da0a0e005a8"

  url "https://downloads.eventideaudio.com/installers/plug-ins/BlackholeImmersive/Blackhole-Immersive-#{version}-osx-installer.dmg"
  name "Blackhole Immersive"
  desc "Eventide immersive/spatial reverb plugin (VST3/AU/AAX)"
  homepage "https://www.eventideaudio.com/plug-ins/blackhole-immersive/"

  livecheck do
    skip "Eventide's download page redirects to a versioned CDN URL; bump manually on new releases"
  end

  installer script: {
    executable: "Blackhole-Immersive-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  uninstall script: {
    executable: "/Applications/Eventide/Uninstallers/Uninstall Blackhole Immersive.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Application Support/Eventide/Blackhole Immersive.properties",
    "~/Library/Audio/Presets/Eventide/Blackhole Immersive",
  ]
end
