cask "blackhole" do
  version "3.11.4"
  sha256 "6cb2868f624676ab6bc3a086485734d9a51d25f0d0067c844e9ba9c8c6428e64"

  url "https://downloads.eventideaudio.com/installers/plug-ins/Blackhole/Blackhole-#{version}-osx-installer.dmg"
  name "Blackhole"
  desc "Eventide reverb plugin (VST3/AU/AAX)"
  homepage "https://www.eventideaudio.com/plug-ins/blackhole/"

  livecheck do
    skip "Eventide's download page redirects to a versioned CDN URL; bump manually on new releases"
  end

  installer script: {
    executable: "Blackhole-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  uninstall script: {
    executable: "/Applications/Eventide/Uninstallers/Uninstall Blackhole.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Application Support/Eventide/Blackhole.properties",
    "~/Library/Application Support/Eventide/Blackhole (No MIDI).properties",
    "~/Library/Audio/Presets/Eventide/Blackhole",
    "~/Library/Audio/Presets/Eventide/Blackhole (No MIDI)",
  ]
end
