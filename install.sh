#!/bin/bash

# Function to detect the package manager
detect_package_manager() {
    if command -v pacman &> /dev/null; then
        echo "arch"
    elif command -v apt &> /dev/null; then
        echo "debian"
    elif command -v dnf &> /dev/null; then
        echo "fedora"
    elif command -v zypper &> /dev/null; then
        echo "suse"
    else
        echo "unknown"
    fi
}

# Install a package based on distro
install_package() {
    local package=$1
    if [[ $DISTRO == "arch" ]]; then
        sudo pacman -S --noconfirm --needed "$package"
    elif [[ $DISTRO == "debian" ]]; then
        sudo apt install -y "$package"
    elif [[ $DISTRO == "fedora" ]]; then
        sudo dnf install -y "$package"
    elif [[ $DISTRO == "suse" ]]; then
        sudo zypper install -y "$package"
    else
        echo "Unsupported distribution for package: $package"
    fi
}

# Install AUR packages (Arch only)
install_aur_package() {
    local package=$1
    if [[ $DISTRO == "arch" ]]; then
        yay -S --noconfirm "$package"
    else
        echo "AUR packages are not supported on non-Arch distros: $package"
    fi
}

# Update and install required packages
install_software() {
    echo "Updating package database..."
    if [[ $DISTRO == "arch" ]]; then
        sudo pacman -Syu --noconfirm
    elif [[ $DISTRO == "debian" ]]; then
        sudo apt update && sudo apt upgrade -y
    elif [[ $DISTRO == "fedora" ]]; then
        sudo dnf update -y
    elif [[ $DISTRO == "suse" ]]; then
        sudo zypper update -y
    else
        echo "Unsupported distribution. Exiting."
        exit 1
    fi

    # Install common packages
    COMMON_PACKAGES=(
        nvim clang cmake thunar docker rofi pulseaudio git
        blueman bluez kitty waybar baobab nm-applet
    )

    for pkg in "${COMMON_PACKAGES[@]}"; do
        install_package "$pkg"
    done

    # Install Arch-specific packages and AUR packages
    if [[ $DISTRO == "arch" ]]; then
        AUR_PACKAGES=(
            vesktop teams-for-linux wlsunset hyprland hyprpaper
            hyprlock nerd-fonts-complete brave-bin
        )
        for aur_pkg in "${AUR_PACKAGES[@]}"; do
            install_aur_package "$aur_pkg"
        done

        # Ensure yay is installed
        if ! command -v yay &> /dev/null; then
            echo "Installing yay (AUR helper)..."
            sudo pacman -S --needed --noconfirm git base-devel
            git clone https://aur.archlinux.org/yay.git
            cd yay || exit
            makepkg -si --noconfirm
            cd .. && rm -rf yay
        fi
    else
        echo "Skipping AUR packages for non-Arch distribution."
    fi

    echo "Installation completed!"
}

# Detect distro
DISTRO=$(detect_package_manager)
echo "Detected package manager: $DISTRO"

install_software

