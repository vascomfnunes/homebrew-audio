# homebrew-audio

A personal [Homebrew](https://brew.sh) tap for audio plugins and apps that
aren't available upstream in `homebrew/cask`.

## Usage

```sh
brew tap vascomnfnunes/audio
brew install --cask wavelab
```

## Casks

| Cask      | Description                          |
| --------- | ------------------------------------- |
| `wavelab` | Steinberg WaveLab audio editing/mastering suite |

## Notes

Steinberg's download URLs are session-specific (they embed a one-time
download ID), so they aren't stable across releases. When a new version
ships, update the `version`, `url`, and `sha256` in the cask manually.
