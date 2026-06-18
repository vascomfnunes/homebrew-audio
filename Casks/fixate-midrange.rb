cask "fixate-midrange" do
  version "1.0.6"
  sha256 "ae49e55f229a0ad56bab77af75500c5d8ac0bd3488900bafad352909ad985ee2"

  url "https://downloads.eventideaudio.com/installers/plug-ins/FixateMidrange/Fixate-Midrange-#{version}-osx-installer.dmg"
  name "Fixate Midrange"
  desc "Newfangled Audio (Eventide) dynamic midrange EQ plugin (VST3/AU/AAX)"
  homepage "https://www.eventideaudio.com/plug-ins/fixate-midrange/"

  livecheck do
    skip "Eventide's download page redirects to a versioned CDN URL; bump manually on new releases"
  end

  installer script: {
    executable: "Fixate-Midrange-#{version}-osx-installer.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  uninstall script: {
    executable: "/Applications/Eventide/Uninstallers/Uninstall Fixate Midrange.app/Contents/MacOS/installbuilder.sh",
    args:       ["--mode", "unattended"],
    sudo:       true,
  }

  zap trash: [
    "~/Library/Application Support/Eventide/Fixate Midrange.properties",
    "~/Library/Audio/Presets/Newfangled Audio/Fixate Midrange",
  ]
end
