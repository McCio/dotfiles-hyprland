# Folder and file lists
FOLDERS = hypr ghostty kitty rofi swaync sys64 waybar wlogout kanshi bongocat
FILES = .zshrc .zsh_aliases

# Packages and plugins
PACKAGES = hyprland hyprpaper hyprlock hypridle waybar swaync ghostty kitty xdg-desktop-portal-hyprland wlogout hyprshot battop-bin syshud hyprsunset python-pywal16 cliphist gowall bongocat noto-fonts noto-fonts-emoji
ASDEPS = ddcutil
HYPRPM_PLUGINS = https://github.com/hyprwm/hyprland-plugins
HYPRPM_ENABLE = hyprexpo

SHELL := /bin/bash
HOME ?= $(shell echo $$HOME)

# Colored log prefixes
INFO  = \033[1;34m[INFO]  \033[0m
WARN  = \033[1;33m[WARN]  \033[0m
ERROR = \033[1;31m[ERROR] \033[0m
OK    = \033[1;32m[OK]    \033[0m

# Helper shell loops
define loop_folders
for folder in $(FOLDERS); do \
	$(1); \
done
endef

define loop_files
for file in $(FILES); do \
	$(1); \
done
endef

.PHONY: help backup check install packages

help:
	@echo -e "Available targets:"
	@echo -e "  help      Show this help message"
	@echo -e "  backup    Backup configs and scripts from home to this repo"
	@echo -e "  check     Show differences between home and backup (folders, files, and packages)"
	@echo -e "  packages  Install all packages and Hyprpm plugins"
	@echo -e "  install   Prompt for packages install, then restore configs and scripts to home"

check:
	@echo -e "$(INFO)Checking differences in folders between home and backup..."
	@$(call loop_folders,diff -r $(HOME)/.config/$$folder ./.config/$$folder --color=always | less -F)
	@echo -e "$(INFO)Checking differences in files between home and backup..."
	@$(call loop_files,diff $(HOME)/$$file ./.config/$$file --color=always | less -F)
	@echo -e "$(INFO)Checking differences in packages between home and backup..."
	@for package in $(PACKAGES); do \
		if ! pacman -Qq $$package 2>/dev/null | grep -qx $$package; then \
			echo -e "$(ERROR)Package $$package is not installed."; \
		fi \
	done
	@for package in $(ASDEPS); do \
		if ! pacman -Qq $$package 2>/dev/null | grep -qx $$package; then \
			echo -e "$(ERROR)Package $$package is not installed."; \
		fi \
	done

backup:
	@echo -e "$(INFO)Backing up configs and scripts..."
	mkdir -p .config
	mkdir -p .bin
	@$(call loop_folders,cp -r $(HOME)/.config/$$folder ./.config || true)
	cp -r $(HOME)/.bin/. ./.bin/
	@$(call loop_files,cp $(HOME)/$$file ./.config/ || true)
	@echo -e "$(OK)Backup complete."

packages:
	@echo -e "$(INFO)Installing packages and Hyprpm plugins..."
	yay -S $(PACKAGES)
	yay -S --asdeps $(ASDEPS)
	@for plugin in $(HYPRPM_PLUGINS); do hyprpm add $$plugin; done
	@for enable in $(HYPRPM_ENABLE); do hyprpm enable $$enable; done
	hyprpm reload
	@echo -e "$(OK)Packages and plugins installation complete."

install:
	@read -p "$$(echo -e '$(INFO)Do you want to install the packages? (y/N): ')" choice; \
	if [[ $$choice == "y" || $$choice == "Y" ]]; then \
		$(MAKE) packages; \
	else \
		echo -e "$(ERROR)Packages installation skipped."; \
	fi
	@$(call loop_folders,cp -r ./.config/$$folder $(HOME)/.config/ || true)
	cp -r ./.bin/* $(HOME)/.bin/
	@$(call loop_files,cp ./.config/$$file $(HOME)/$$file || true)
	@echo -e "$(OK)Install complete."
