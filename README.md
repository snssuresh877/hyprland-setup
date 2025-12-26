# hyprland-setup
# Hyprland Setup for Arch Linux

A simple, automated script and configuration to install and configure a **Hyprland desktop environment** on Arch Linux.

This repository installs:
- Hyprland and related Wayland utilities
- Essential apps and tools (terminal, launcher, media, power, networking)
- AUR helper setup (`yay`)
- Power management and laptop support  
(see full package list in the install script)

## 📦 Features

✔ Automatic installation of core Hyprland components  
✔ Polkit & portal support for Wayland  
✔ Power & battery management  
✔ Clipboard, notifications, and utilities support  
✔ Fonts and themes for a polished look  
✔ AUR helper installation (`yay`)  
✔ Optional dotfile integration

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/snssuresh877/hyprland-setup.git
cd hyprland-setup


2. Review the script

Before running any installer script, always review it:

nano hyprland-setup-essencial.sh

3. Make it executable and run
chmod +x hyprland-setup-essencial.sh
./hyprland-setup-essencial.sh

4. Reboot

After installation completes:

sudo reboot

## **Why this script?**

This script aims to provide a complete, sane setup for Hyprland on Arch Linux. It installs:

✔ Core display and Wayland stack

Hyprland

hyprlock, hypridle, hyprpaper

xdg-desktop-portal-hyprland

Polkit & authentication agents

✔ Power and laptop support

TLP and thermald

Brightness and battery tools

Suspend/hibernate helpers

✔ User utilities

Rofi launcher

Kitty terminal

Clipboard tools

File manager and removable media support

✔ AUR helper

Installs yay for AUR package management

✔ Optional extra tools

Media utilities, fonts, themes, and nice-to-have tools

🧾 System Requirements

Arch Linux (or Arch-based distro)

Internet access

UEFI system recommended

Optional: Windows dual-boot support (NTFS, polkit)

🧩 Post-Installation

After reboot, you can customize:

Hyprland config: ~/.config/hypr/

Waybar config: ~/.config/waybar/

Rofi scripts: ~/.config/rofi/

Power scripts: ~/.config/hypr/scripts/

Example:

~/.config/hypr/scripts/powermenu.sh

📊 What’s Included
Category	Installed
Display	Hyprland, SDDM
Terminal	kitty
Launcher	rofi
Power	TLP, thermald
File system	Thunar, udiskie, ntfs-3g
Audio	pipewire, pavucontrol
Utilities	neovim, fastfetch, btop
AUR helper	yay

(See hyprland-setup.sh for the full exact list)

🛠 Recommended Next Steps

After setup, you can add:

Waybar modules (system stats, updates, battery)

Rofi menus (launcher, power menu)

Keybindings (Hyprland conf)

Dotfiles sync (GitHub or Gist)

📚 Useful Links

Hyprland official GitHub: https://github.com/hyprwm/Hyprland

Hyprland wiki / guides: https://wiki.hypr.land/

Awesome Hyprland community repo: https://github.com/hyprland-community/
