# Penpoint Homebrew tap

Homebrew casks for apps published by [Penpoint](https://penpoint.dev).

## Install

```sh
brew install penpointdev/tap/peepmd
```

Homebrew requires trust for taps outside Homebrew itself. Installing by the
full name, as above, trusts only the `peepmd` cask, not the rest of the tap.

To install by the short name, tap first and trust the cask:

```sh
brew tap penpointdev/tap
brew trust --cask penpointdev/tap/peepmd
brew install --cask peepmd
```

Without `brew trust`, Homebrew refuses to load the cask. See
[Tap Trust](https://docs.brew.sh/Tap-Trust).

## Casks

| Cask | App |
| --- | --- |
| `peepmd` | PeepMD, a Quick Look preview for Markdown files. Downloads from [penpointdev/peepmd-releases](https://github.com/penpointdev/peepmd-releases/releases). |

## Updates

PeepMD's release script opens a pull request here for each Release, with the
new `version` and `sha256`. CI runs `brew style` and
`brew audit --cask --strict --online` on every pull request. Updates are
merged by hand after the Release is published.
