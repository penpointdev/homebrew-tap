# Penpoint Homebrew tap

Homebrew casks for apps published by [Penpoint](https://penpoint.dev).

| Cask | App |
| --- | --- |
| `peepmd` | PeepMD, a Quick Look preview for Markdown files. Downloads from [penpointdev/peepmd-releases](https://github.com/penpointdev/peepmd-releases/releases). |

## PeepMD

PeepMD shows Markdown files rendered when you press Space on them in Finder.
The full user guide, with screenshots, installing by hand and checking the
signature, is the
[PeepMD README](https://github.com/penpointdev/peepmd-releases#readme). This
page covers the Homebrew details.

### Requirements

macOS 26 (Tahoe) or later. The cask refuses to install on older versions.

### Install

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

### After installing

1. Open PeepMD once, so that macOS registers its Quick Look extension:

   ```sh
   open -a PeepMD
   ```

   The first time, macOS asks whether you want to open an app downloaded from
   the Internet. Click **Open**.

2. Turn on the extension. In the PeepMD window, click **Open Quick Look
   Settings…**, or go to **System Settings › General › Login Items &
   Extensions › Quick Look**, and turn on **PeepMD Preview**.

3. Select a Markdown file in Finder and press Space.

You do not need to keep PeepMD open. Quick Look uses the extension on its own.

If another Markdown Quick Look extension is installed, for example QLMarkdown,
turn it off in the same list, or macOS may use it instead of PeepMD.

### Images and the folder access prompt

When a file in Documents, Desktop or Downloads shows an image that sits next to
it, macOS asks once for access to that folder, for example: "PeepMD.app would
like to access files in your Documents folder." With **Allow**, PeepMD shows
the images. With **Don't Allow**, images show as placeholders and the rest of
the Preview is the same. A file without local images never makes macOS ask.
You can change your answer in **System Settings › Privacy & Security › Files &
Folders**. More in the PeepMD README:
[Images and the folder access
prompt](https://github.com/penpointdev/peepmd-releases#images-and-the-folder-access-prompt).

### Update

```sh
brew upgrade --cask peepmd
```

`brew upgrade` with no name also updates PeepMD when a new version is out.
After the update, Homebrew resets Quick Look (`qlmanage -r`) so the new
extension is used.

### Uninstall

```sh
brew uninstall --cask peepmd
```

This removes `PeepMD.app`. To also remove the data macOS keeps for PeepMD's
app sandbox, use `--zap`:

```sh
brew uninstall --zap --cask peepmd
```

`--zap` also moves these to the Trash:

- `~/Library/Application Scripts/dev.penpoint.peepmd*`
- `~/Library/Containers/dev.penpoint.peepmd*`

PeepMD keeps no settings or documents there, only what macOS makes for any
sandboxed app and extension.

### Report a problem

Open an issue in
[penpointdev/peepmd-releases](https://github.com/penpointdev/peepmd-releases/issues),
also for problems with the cask. The PeepMD README says
[what to include](https://github.com/penpointdev/peepmd-releases#report-a-problem).

## Cask updates

PeepMD's release script opens a pull request here for each Release, with the
new `version` and `sha256`. CI runs `brew style` and
`brew audit --cask --strict --online` on every pull request. Updates are
merged by hand after the Release is published.
