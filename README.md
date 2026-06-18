# homebrew-audio

A personal [Homebrew](https://brew.sh) tap for audio plugins and apps that
aren't available upstream in `homebrew/cask`.

## Usage

```sh
brew tap vascomfnunes/audio
brew install --cask wavelab
```

## Casks

| Cask                  | Description                                      |
| ---------------------- | ------------------------------------------------- |
| `wavelab`              | Steinberg WaveLab audio editing/mastering suite   |
| `korg-software-pass`   | Manager for activating and updating KORG software |
| `plugin-alliance-installation-manager` | Manager for installing/updating Plugin Alliance plugins |
| `roland-cloud-manager` | Manager for installing/updating Roland Cloud instruments and effects |
| `ssl-download-manager` | Manager for installing/updating Solid State Logic plugins |
| `xln-online-installer` | Manager for installing/updating XLN Audio products |
| `blackhole` | Eventide reverb plugin (VST3/AU/AAX) |
| `blackhole-immersive` | Eventide immersive/spatial reverb plugin (VST3/AU/AAX) |
| `fixate-midrange` | Newfangled Audio (Eventide) dynamic midrange EQ plugin (VST3/AU/AAX) |
| `micropitch` | Eventide stereo pitch-shifting/doubling plugin (VST3/AU/AAX) |
| `tape` | Softube analog tape machine emulation plugin (VST/VST3/AU/AAX) |
| `dirty-tape` | Softube lo-fi tape distortion and saturation plugin (VST/VST3/AU/AAX) |
| `acoustic-feedback` | Softube guitar feedback simulation plugin (VST/VST3/AU/AAX) |
| `clipper` | Softube peak-clipping plugin for mixing and mastering (VST/VST3/AU/AAX) |
| `transient-shaper` | Softube dual-band attack/decay shaping plugin (VST/VST3/AU/AAX) |

## Notes

- Steinberg's download URLs are session-specific (they embed a one-time
  download ID), so they aren't stable across releases. When a new version
  ships, update the `version`, `url`, and `sha256` in the `wavelab` cask
  manually.
- KORG's download URL is a fixed redirect that always serves the latest
  installer, so it can't be used to detect new versions automatically either.
  Update the `korg-software-pass` cask manually when KORG ships a new build.
- `plugin-alliance-installation-manager` ships as a zip wrapping a versioned
  dmg; `brew audit --cask --strict` fails on it with a benign
  `rb_sysopen`/`No such file or directory` error due to a Homebrew audit-tool
  quirk with single-file zip-nested-dmg containers (its internal extraction
  shortcut renames the lone extracted file before checking the nested path).
  Actual install/uninstall works correctly; this is a known false positive,
  not a defect in the cask.
- `roland-cloud-manager` ships a GUI installer wizard (no silent/CLI install
  flag), so the cask uses `installer manual:` — `brew install` mounts the
  dmg and prints the path to open and run by hand; it doesn't install
  unattended. Uninstalling removes a root-owned app, so `brew uninstall`
  needs an interactive `sudo` prompt.
- `ssl-download-manager`'s upstream `Info.plist` declares `LSMinimumSystemVersion
  12.0`, which triggers a Homebrew audit bug (`undefined method '>' for nil`
  in `audit_min_os`) on casks that omit `depends_on macos:`. Worked around
  by declaring `depends_on macos: :monterey` explicitly, which is accurate
  anyway.
- XLN's own download endpoint (`https://www.xlnaudio.com/api/download/96`)
  redirects to its S3-hosted installer, but the `Location` header contains
  unencoded spaces, which breaks Homebrew's URI parser on both `brew audit`
  and a real `brew fetch`/`install` (not just an audit quirk). The
  `xln-online-installer` cask points directly at the resolved,
  percent-encoded S3 URL instead. That URL embeds the version, so it goes
  stale on new releases — update `version`, `url`, and `sha256` manually,
  same as `wavelab`.
- `blackhole`, `blackhole-immersive`, `fixate-midrange`, and `micropitch` are
  Eventide/Newfangled Audio plugins shipped as BitRock InstallBuilder
  installer apps with no GUI fallback needed: they support a real silent
  install via `installbuilder.sh --mode unattended`, so the casks use
  `installer script:` with `sudo: true` (same pattern as Homebrew's own
  `audio-modeling-software-center`/`izotope-product-portal` casks).
  Uninstall calls the per-product uninstaller Eventide installs at
  `/Applications/Eventide/Uninstallers/Uninstall <Name>.app`, same flags.
  Eventide's download pages (e.g.
  `eventideaudio.com/downloads/blackhole-installer-mac-64-bit/`) 302-redirect
  to a versioned CDN URL; the casks point at that resolved URL directly, so
  bump `version`/`url`/`sha256` manually on new releases.
- `tape`, `dirty-tape`, `acoustic-feedback`, `clipper`, and `transient-shaper`
  are Softube plugins shipped as flat (non-distribution) `.pkg` installers,
  so the casks use a plain `pkg` artifact with no install script. Each pkg's
  `PackageInfo` declares a single top-level identifier (e.g.
  `com.softube.pkg.PlugIns_Tape`) that matches the receipt `pkgutil` records
  on install, so `uninstall pkgutil:` with that identifier removes every file
  the bom installed (VST/VST3/AU/AAX, SSX, and factory presets, all under
  `/Library`). The only thing left behind is each plugin's Studio One preset
  copy (only created if Studio One is installed), which `zap` removes. The
  download URL embeds both the version (`2.6.38`) and a release build suffix
  (`02148737`) that aren't necessarily in lockstep, so livecheck is skipped
  and both segments need a manual bump on new releases; the CDN domain also
  differs from the homepage domain, so `url` carries a `verified:` parameter
  (same pattern Homebrew's own `softube-central` cask uses).
