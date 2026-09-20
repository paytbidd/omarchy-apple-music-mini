-- Apple Music Mini: keep the webapp renderer alive on the scratchpad /
-- other workspaces so Chromium does not pause <audio> as occluded.
-- Opaque like other media webapps (YouTube), not the default browser dim.
o.window("^.+-music\\.apple\\.com__.*$", {
  tag = "-chromium-based-browser",
})
o.window("^.+-music\\.apple\\.com__.*$", {
  tag = "-default-opacity",
  render_unfocused = true,
})
