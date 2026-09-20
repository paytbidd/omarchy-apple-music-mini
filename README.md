# Apple Music Mini

Miniplayer overlay for [Iulian Safta’s Omarchy Apple Music plugin](https://github.com/iuliansafta/omarchy-apple-music).

Install pulls **latest upstream**, then applies Payton’s tweaks. Unapply restores stock.

Upstream is MIT. This overlay is MIT too.

## What you get

- Miniplayer popup: full-bleed artwork, themed Omarchy control panel (same chrome as wifi/sound/weather), larger transport, hoverable Up next / Recently played rows, open-in-new instead of an “Open Apple Music” text button
- Chromium stays playing when the window is on the scratchpad or another workspace
- Bar puck keeps album art on pause instead of the Chromium product icon

## Install

One shot:

```bash
curl -fsSL https://raw.githubusercontent.com/paytbidd/omarchy-apple-music-mini/main/install | bash
```

Or the Omarchy form, then apply:

```bash
omarchy plugin add https://github.com/paytbidd/omarchy-apple-music-mini.git --yes
~/.config/omarchy/plugins/payton.apple-music-mini/scripts/apple-music-mini apply
```

That will:

1. Install or reuse `iuliansafta.apple-music`
2. Patch it in place (working tree only — upstream git history stays clean)
3. Add Hyprland `render_unfocused` rules for the Apple Music webapp
4. Register the dedicated Chromium launcher

Sign in inside the Apple Music window with an Apple Music subscription.

## Unapply

Tweaks off, keep the stock plugin:

```bash
~/.config/omarchy/plugins/payton.apple-music-mini/scripts/apple-music-mini unapply
```

Tweaks off and remove Mini itself:

```bash
curl -fsSL https://raw.githubusercontent.com/paytbidd/omarchy-apple-music-mini/main/uninstall | bash
```

or:

```bash
~/.config/omarchy/plugins/payton.apple-music-mini/scripts/apple-music-mini unapply --purge
```

`iuliansafta.apple-music` stays installed either way.

## Update

Grab the latest Mini patches **and** the latest upstream plugin, then re-apply:

```bash
~/.config/omarchy/plugins/payton.apple-music-mini/scripts/apple-music-mini update
```

Do not `omarchy plugin update iuliansafta.apple-music` while Mini is applied — the dirty working tree cannot fast-forward. Use Mini’s `update` instead.

## Status

```bash
~/.config/omarchy/plugins/payton.apple-music-mini/scripts/apple-music-mini status
```

## Optional keybind

Omarchy’s default Super+Shift+M is Music (Spotify). To point it at Apple Music, in `~/.config/hypr/bindings.lua`:

```lua
hl.unbind("SUPER + SHIFT + M")
o.bind(
  "SUPER + SHIFT + M",
  "Apple Music",
  os.getenv("HOME") .. "/.config/omarchy/plugins/iuliansafta.apple-music/scripts/apple-music open"
)
```

## Notes

- Hide the player with Super+Alt+S (scratchpad). Super+W closes Chromium and stops playback.
- If an upstream Apple Music plugin release does not apply, `update` will say so; file an issue on this repo with the upstream revision.
