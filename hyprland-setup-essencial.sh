#!/usr/bin/env bash
set -e

echo "🚀 Installing Omarchy-style Hyprland setup..."

# --------------------------------------------------
# Core system & build tools
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  base-devel git curl wget \
  linux linux-firmware amd-ucode \
  networkmanager iwd \
  bluez bluez-utils \
  pipewire pipewire-pulse pipewire-jack wireplumber \
  polkit polkit-kde-agent \
  seatd dbus

sudo systemctl enable NetworkManager bluetooth seatd

# --------------------------------------------------
# Hyprland core
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  hyprland hyprlock hypridle \
  xdg-desktop-portal-hyprland \
  hyprpolkitagent \
  uwsm

# --------------------------------------------------
# Wallpaper & theming (STABLE)
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  swww python-pywal

# --------------------------------------------------
# Display manager
# --------------------------------------------------
sudo pacman -S --needed --noconfirm sddm
sudo systemctl enable sddm

# --------------------------------------------------
# Terminal, bar & launcher
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  kitty rofi \
  wl-clipboard cliphist \
  grim slurp swappy \
  swaync waybar

# --------------------------------------------------
# File manager & disks
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  thunar thunar-volman thunar-archive-plugin \
  gvfs gvfs-mtp gvfs-smb \
  udiskie ntfs-3g

# --------------------------------------------------
# Audio / brightness / power
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  pavucontrol pamixer \
  brightnessctl playerctl \
  upower tlp tlp-rdw thermald

sudo systemctl enable tlp thermald

# --------------------------------------------------
# Fonts (essential)
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  ttf-jetbrains-mono-nerd \
  ttf-fira-code \
  noto-fonts noto-fonts-emoji \
  otf-font-awesome

# --------------------------------------------------
# Appearance
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  papirus-icon-theme \
  kvantum qt5ct qt6ct \
  nwg-look

# --------------------------------------------------
# Utilities
# --------------------------------------------------
sudo pacman -S --needed --noconfirm \
  mpv imv \
  fastfetch btop htop \
  neovim ripgrep fd fzf jq \
  unzip unrar \
  yazi

# --------------------------------------------------
# Set Neovim as default editor
# --------------------------------------------------
echo "📝 Setting Neovim as default editor..."

sudo tee /etc/profile.d/editor.sh >/dev/null <<'EOF'
export EDITOR=nvim
export VISUAL=nvim
EOF

sudo tee /etc/sudoers.d/editor >/dev/null <<'EOF'
Defaults editor=/usr/bin/nvim
EOF
sudo chmod 440 /etc/sudoers.d/editor

git config --global core.editor "nvim"

# --------------------------------------------------
# LazyVim installation (official)
# --------------------------------------------------
echo "🚀 Installing LazyVim..."

if [ -d "$HOME/.config/nvim" ]; then
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak.$(date +%s)"
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# --------------------------------------------------
# AUR helper (yay)
# --------------------------------------------------
if ! command -v yay >/dev/null; then
  echo "📦 Installing yay..."
  cd /tmp
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
fi

# --------------------------------------------------
# AUR packages
# --------------------------------------------------
yay -S --needed --noconfirm \
  wlogout \
  rate-mirrors-bin \
  visual-studio-code-bin

echo
echo "✅ Omarchy-style Hyprland installation complete!"
echo "➡️ Reboot recommended"
echo "➡️ First Neovim launch: nvim (LazyVim will auto-install plugins)"
