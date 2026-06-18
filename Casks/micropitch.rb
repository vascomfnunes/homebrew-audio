cask "micropitch" do
  version "1.3.4"
  sha256 "86158ceb95cf45454e14e30aa1768a65427f59e284ee08d87560dfbca45aa382"

  url "https://downloads.eventideaudio.com/installers/plug-ins/MicroPitch/MicroPitch-#{version}-osx-installer.dmg"
  name "MicroPitch"
  desc "Eventide stereo pitch-shifting/doubling plugin (VST3/AU/AAX)"
  homepage "https://www.eventideaudio.com/plug-ins/micropitch/"

  livecheck do
    skip "Eventide's download page redirects to a versioned CDN URL; bump manually on new releases"
  end

  installer script: {
    executable: "MicroPitch-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  uninstall script: {
    executable: "/Applications/Eventide/Uninstallers/Uninstall MicroPitch.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Application Support/Eventide/MicroPitch.properties",
    "~/Library/Audio/Presets/Eventide/MicroPitch",
  ]
end
