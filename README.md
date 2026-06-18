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

## Notes

- Steinberg's download URLs are session-specific (they embed a one-time
  download ID), so they aren't stable across releases. When a new version
  ships, update the `version`, `url`, and `sha256` in the `wavelab` cask
  manually.
- KORG's download URL is a fixed redirect that always serves the latest
  installer, so it can't be used to detect new versions automatically either.
  Update the `korg-software-pass` cask manually when KORG ships a new build.
