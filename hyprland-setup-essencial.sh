#!/usr/bin/env bash
set -e

echo "🚀 Installing Hyprland base setup..."

# -----------------------------
# Core system & build tools
# -----------------------------
sudo pacman -S --needed --noconfirm \
  base-devel git curl wget \
  linux linux-firmware amd-ucode \
  networkmanager iwd \
  bluez bluez-utils \
  pipewire pipewire-pulse pipewire-jack wireplumber \
  polkit polkit-kde-agent \
  seatd dbus

sudo systemctl enable NetworkManager bluetooth seatd

# -----------------------------
# Hyprland core
# -----------------------------
sudo pacman -S --needed --noconfirm \
  hyprland hyprpaper hyprlock hypridle \
  xdg-desktop-portal-hyprland \
  hyprpolkitagent \
  uwsm

# -----------------------------
# Display manager
# -----------------------------
sudo pacman -S --needed --noconfirm sddm
sudo systemctl enable sddm

# -----------------------------
# Terminal & launcher
# -----------------------------
sudo pacman -S --needed --noconfirm \
  kitty rofi \
  wl-clipboard cliphist \
  grim slurp swappy \
  swaync waybar

# -----------------------------
# File manager & disks
# -----------------------------
sudo pacman -S --needed --noconfirm \
  thunar thunar-volman thunar-archive-plugin \
  gvfs gvfs-mtp gvfs-smb \
  udiskie ntfs-3g

# -----------------------------
# Audio / brightness / power
# -----------------------------
sudo pacman -S --needed --noconfirm \
  pavucontrol pamixer \
  brightnessctl playerctl \
  upower tlp tlp-rdw thermald

sudo systemctl enable tlp thermald

# -----------------------------
# Fonts (essential)
# -----------------------------
sudo pacman -S --needed --noconfirm \
  ttf-jetbrains-mono-nerd \
  ttf-fira-code \
  noto-fonts noto-fonts-emoji \
  otf-font-awesome

# -----------------------------
# Appearance & theming
# -----------------------------
sudo pacman -S --needed --noconfirm \
  papirus-icon-theme \
  kvantum qt5ct qt6ct \
  nwg-look

# -----------------------------
# Media & utilities
# -----------------------------
sudo pacman -S --needed --noconfirm \
  mpv imv \
  fastfetch btop htop \
  neovim ripgrep fd fzf jq \
  unzip unrar

# -----------------------------
# AUR helper (yay)
# -----------------------------
if ! command -v yay >/dev/null; then
  echo "📦 Installing yay..."
  cd /tmp
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
fi

# -----------------------------
# AUR packages (safe & useful)
# -----------------------------
yay -S --needed --noconfirm \
  wlogout \
  rate-mirrors-bin \
  visual-studio-code-bin

echo "✅ Hyprland setup installation complete!"
echo "➡️ Reboot recommended"
