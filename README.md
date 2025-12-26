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

⚙️ What this script installs

The script installs:

Wayland compositor: Hyprland

Display manager: SDDM

Terminal: kitty

Launcher: rofi

Power tools: tlp, thermald

Clipboard tools: wl-clipboard

AUR helper: yay

Popular utilities: neovim, fastfetch, btop, etc.

(See the script for the exact package list)

📁 Configuration

After running the script, you can:

Modify your Hyprland config in ~/.config/hypr/

Add Waybar config in ~/.config/waybar/

Add launcher/power scripts in ~/.config/rofi/

🧠 Notes

Designed for Arch Linux (and derivatives)

Tested on AMD/Intel laptops

Works with SDDM or manual start-hyprland login

Uses yay for AUR packages

📚 Useful Links

Hyprland official repo: https://github.com/hyprwm/Hyprland
 
GitHub

Hyprland wiki: https://wiki.hypr.land/
 
Hyprland Wiki

Awesome Hyprland tools: https://github.com/hyprland-community/awesome-hyprland
 
GitHub
