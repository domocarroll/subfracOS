# subfracOS Handoff Document

## What Is This

subfracOS is a whitelabel of [omarchy](https://github.com/basecamp/omarchy) (DHH's opinionated Arch Linux distro) for **subfracture** studio. Domain: subfrac.cloud

## Repo

https://github.com/domocarroll/subfracOS

## What's Been Done

### The Great Rename (Complete)
- Forked basecamp/omarchy v3.1.5
- Renamed all 131 `omarchy-*` bin scripts to `subfrac-*`
- Replaced 464 occurrences of omarchy/Omarchy/OMARCHY across 192 files
- Updated all env vars (`OMARCHY_*` -> `SUBFRAC_*`), paths, display strings, system configs
- 29 "omarchy" references remain intentionally (real package names from omarchy's pacman repo: `omarchy-chromium`, `omarchy-nvim`, `omarchy-keyring`, `omarchy-walker`, `pkgs.omarchy.org`)

### Art Assets (Complete)
- ASCII wordmark "SUBFRAC" in Unicode block chars (`logo.txt`, `screensaver.txt`)
- Fractured square icon - diagonal crack through solid square (`icon.txt`, `about.txt`)
- SVG pixel-font logo "SUBFRAC" (`logo.svg`) - rect-based on 15px grid, 1215x285
- 8 generated wallpapers in `themes/subfrac/backgrounds/`:
  - 1-voronoi-fracture.png (16:9, cyan/purple hexagon)
  - 2-explosive-shatter.png (16:9, dynamic shards)
  - 3-fractured-square-minimal.png (16:9, line-art square with fractal branch)
  - 4-glass-shards.png (16:9, photorealistic floating crystal)
  - 5-tectonic-wireframe.png (21:9, cyan wireframe terrain)
  - 6-cracking-monolith.png (16:9, obsidian monolith with lightning)
  - 7-crystal-obelisk-vertical.png (9:16, for portrait monitor)
  - 8-dissolving-column-vertical.png (9:16, for portrait monitor)

### Custom Theme: "subfrac" (Complete)
Full theme at `themes/subfrac/` with 14 config files covering: alacritty, kitty, ghostty, hyprland, hyprlock, mako, waybar, walker, swayosd, btop, vscode, neovim, chromium, icons.

**Palette:**
- Background: `#0d0f18` (deep midnight)
- Foreground: `#c8d0e8` (cool silver)
- Primary accent: `#00e5ff` (electric cyan) - THE signature color
- Secondary: `#b48eff` (violet)
- Tertiary: `#f0c674` (warm amber)
- Border gradient: electric cyan -> violet (45deg)

### Applied to Live Machine
- Theme applied via `omarchy-theme-set subfrac` on the live system
- Branding files (logo, icon, about, screensaver) replaced in live install
- Per-monitor wallpapers set: landscape on eDP-1, crystal obelisk on DP-2 (vertical)
- To revert: `omarchy-theme-set tokyo-night`

## Current Machine State

- **OS**: CachyOS (Arch-based), kernel 6.12.50-2-cachyos-lts
- **WM**: Hyprland
- **Monitors**: eDP-1 (2560x1600 @2x, MacBook display), DP-2 (2560x1440, rotated 270 = vertical)
- **Live install**: still at `~/.local/share/omarchy/` with `omarchy-*` command names
- **subfracOS source**: `/home/dom/subfracOS/` (the renamed fork, pushed to GitHub)
- **Art staging**: `/home/dom/subfracOS-art/` (wallpapers, ASCII art originals)

## What's NOT Done Yet

### High Priority
1. **Live shader wallpaper** (see next section - this is the active task)
2. **Full path migration** - replace live `~/.local/share/omarchy` with subfracOS install (requires compat symlinks, PATH updates, careful session handling)
3. **Default app curation** - remove 37signals apps (HEY, Basecamp), add studio-relevant defaults

### Medium Priority
4. **Custom `subfrac.ttf`** - waybar glyph font (currently using omarchy's)
5. **Plymouth boot splash** - subfracOS boot animation
6. **Limine bootloader** - colors already updated in source, need to apply to live system
7. **Set subfrac as default theme** in install flow (instead of tokyo-night)
8. **Starship prompt** config for subfrac palette

### Low Priority
9. Own package repo at `pkgs.subfrac.cloud`
10. Custom neovim colorscheme (currently using tokyonight-night as proxy)
11. Custom VS Code theme

## ACTIVE TASK: Live Shader Wallpaper

The user wants to explore WebGL2 / GLSL shader wallpapers instead of static images. This is the next thing to build.

### Research Findings

**Viable approaches on Hyprland/Wayland:**

1. **`glpaper`** - Wayland wallpaper that runs GLSL fragment shaders. Purpose-built for this. Renders as a `wl_layer_surface` behind windows.
   - https://github.com/Duckonaut/glpaper

2. **`mpvpaper`** - Uses mpv as wallpaper. Can run shader files via mpv's GPU pipeline or play rendered video loops.

3. **`swww`** - Animated wallpaper daemon for Wayland. Supports transitions but not live shaders directly.

4. **Custom solution** - Write a small Wayland client using `wlr-layer-shell` protocol that runs a WebGL2/EGL context. More control, more work.

### Recommended Approach

**glpaper** is the cleanest path. Write a GLSL fragment shader that renders:
- Animated Voronoi tessellation (the fracture pattern)
- Subtle glow animation along fracture lines in electric cyan (#00e5ff) and violet (#b48eff)
- Deep midnight base (#0d0f18)
- Slow, hypnotic movement - not distracting for a wallpaper
- Optionally reactive to time-of-day (warmer at night, cooler during day)

The shader should be a single `.frag` file. glpaper provides `time`, `resolution`, and `mouse` uniforms similar to Shadertoy.

### Alternative: Pure HTML/WebGL2

If glpaper doesn't cut it, build a Three.js or raw WebGL2 scene:
- Render to a borderless fullscreen window on the wallpaper layer
- Could use `wlr-layer-shell` via a toolkit like GTK4 or a lightweight EGL wrapper
- More capable (3D geometry, post-processing, particle systems)
- But heavier and more complex to integrate

### Plan of Attack

1. Check if `glpaper` is available/installable on this system
2. If yes: write the Voronoi fracture GLSL shader
3. Test it on the vertical monitor first (DP-2)
4. If it works well, extend to both monitors with different shader params
5. If glpaper isn't viable, fall back to mpvpaper + pre-rendered shader video
6. Integrate into subfracOS as the default wallpaper experience (replacing swaybg)

### Shader Design Notes

A good wallpaper shader should:
- Run at low FPS (15-30) to not waste GPU
- Use smooth, slow animations (cycle time 30-60 seconds)
- Be resolution-independent
- Have configurable colors via uniforms (so theme switching can change the shader palette)
- Not be distracting - subtle movement that rewards attention but doesn't demand it

The Voronoi fracture concept: imagine a dark surface with hairline cracks. Light slowly pulses through the cracks, shifting between cyan and violet. Occasionally a new crack forms, propagating across the surface. The pattern evolves but never repeats.
