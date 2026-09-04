# updated-i3wm-dotfiles

My personal **i3wm dotfiles** for a lightweight, minimal, and highly customized Linux desktop.

Built around **i3wm**, with a collection of configs for my terminal, status bar, application launcher, compositor, music visualizer, and system information.

## 📸 Preview

![Desktop](rice2.png)

## 🧩 What's Included

| Component                                               | Purpose                      |
| ------------------------------------------------------- | ---------------------------- |
| [i3](https://i3wm.org/)                                 | Window manager               |
| [Polybar](https://github.com/polybar/polybar)           | Status bar                   |
| [Rofi](https://github.com/davatorium/rofi)              | Application launcher / menus |
| [Picom](https://github.com/yshui/picom)                 | X11 compositor               |
| [WezTerm](https://wezterm.org/)                         | Terminal emulator            |
| [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | System information           |
| [Cava](https://github.com/karlstav/cava)                | Audio visualizer             |

## 📁 Structure

```text
.
├── cava/        # Cava configuration
├── fastfetch/   # Fastfetch configuration
├── i3/          # i3wm configuration
├── picom/       # Picom configuration
├── polybar/     # Polybar configuration and scripts
├── rofi/        # Rofi configuration and themes
├── wezterm/     # WezTerm configuration
├── 2326686.png  # Desktop screenshot
└── README.md
```

## ⚙️ Setup

These are **personal dotfiles**, so they aren't intended to be a universal installer.

Clone the repository:

```bash
git clone https://github.com/rin1wav/updated-i3wm-dotfiles.git
cd updated-i3wm-dotfiles
```

Copy the configurations you want into your `~/.config` directory:

```bash
cp -r i3 ~/.config/
cp -r polybar ~/.config/
cp -r rofi ~/.config/
cp -r cava ~/.config/
cp -r fastfetch ~/.config/
cp -r wezterm ~/.config/
```

For Picom:

```bash
cp -r picom ~/.config/
```

> **Tip:** Back up your existing configurations before replacing them.

## 🎨 Philosophy

The setup is focused on keeping the desktop:

* Minimal
* Lightweight
* Clean
* Keyboard-driven
* Customizable

Rather than using a full desktop environment, the configuration is built around **i3wm + lightweight utilities**.

## 🛠️ Requirements

At minimum, you'll need:

```text
i3
polybar
rofi
picom
wezterm
fastfetch
cava
```

Some scripts or individual configurations may require additional packages depending on how they are used.

## 📝 Notes

These configurations reflect my personal setup and may require modification depending on your:

* Distribution
* Hardware
* Display resolution
* Installed fonts
* Audio setup
* Preferred applications

Don't blindly copy everything into `~/.config` — inspect and adapt the configs to your system.

## ⭐ Credits

Built and maintained by **rin1wav**.

Inspired by the Linux ricing / dotfiles community.

---

**If you find these configs useful, feel free to star the repository.**
