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
