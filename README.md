# ☁ scdl

Paste a SoundCloud link, pick a format, get the audio. A small terminal app on top of
[yt-dlp](https://github.com/yt-dlp/yt-dlp), [ffmpeg](https://ffmpeg.org) and [gum](https://github.com/charmbracelet/gum).

## Install

```sh
./install.sh
```

Installs the Homebrew dependencies and symlinks `scdl` (and the shorter alias `sound`) into `~/.local/bin`, so edits in this repo are live.

## Use

```sh
sound                 # same as scdl
scdl                  # interactive — picks up a SoundCloud link from the clipboard
scdl <url>            # skip the paste step
scdl <url> mp3        # no prompts; format = best | mp3 | wav | flac
```

1. Copy a track, playlist or set link (share-link junk like `?si=…&utm_…` is stripped).
2. Check the track card, pick a format.
3. Watch the progress bar; get a notification, then *Show in Finder* / *Play it* / *Download another*.

Files land in `~/Documents/dj/`, the Cratekeeper library folder (set `SCDL_DIR` to change it). Playlists get their own folder with numbered tracks.

## Formats

| Format | What you get |
|--------|--------------|
| `best` | SoundCloud's original stream (usually 160 kbps AAC `.m4a`), no re-encode, cover art + tags. **Recommended.** |
| `mp3`  | VBR ~245 kbps, cover art + tags. Plays everywhere. |
| `wav`  | 16-bit / 44.1 kHz PCM. For DAWs and DJ software that want it. |
| `flac` | Lossless container, cover art + tags. |

SoundCloud only streams lossy audio, so `wav` and `flac` are bigger files, not better-sounding ones.

## When it breaks

SoundCloud changes things occasionally; yt-dlp usually ships a fix within days:

```sh
brew upgrade yt-dlp
```

## Note

For personal use. Downloading outside SoundCloud's own Download button is against their Terms — if an artist sells
or offers a free download of a track, get it from them.
