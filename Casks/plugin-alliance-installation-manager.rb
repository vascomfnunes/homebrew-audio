cask "plugin-alliance-installation-manager" do
  version "1.4.0"
  sha256 "524b79d03170653d28e835cb4d6ec2ee20a0123c0f6f9d73194cec5fd39189b8"

  url "https://pluginalliance.myshopify.com/cdn/shop/files/pa_installation_manager_mac_#{version.gsub(".", "_")}.zip",
      verified: "pluginalliance.myshopify.com/cdn/shop/files/"
  name "Plugin Alliance Installation Manager"
  desc "Manager for installing and updating Plugin Alliance/Brainworx plugins"
  homepage "https://www.plugin-alliance.com/"

  livecheck do
    skip "Shopify CDN URL is versioned by filename; bump manually on new releases"
  end

  container nested: "PA-InstallationManager-v#{version}.dmg"

  app "PA-InstallationManager.app"

  zap trash: [
    "~/Library/Application Support/Plugin Alliance Installation Manager",
    "~/Library/Preferences/com.plugin-alliance.plugins.PAInstallationManager.plist",
  ]
end
