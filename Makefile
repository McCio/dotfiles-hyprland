# Folder and file lists
FOLDERS = hypr ghostty kitty rofi swaync sys64 waybar wlogout kanshi
FILES = .zshrc .zsh_aliases

# Packages and plugins
PACKAGES = hyprland hyprpaper hyprlock hypridle waybar swaync ghostty kitty xdg-desktop-portal-hyprland wlogout hyprshot battop syshud hyprsunset rofi-wayland python-pywal cliphist gowall bongocat noto-fonts noto-fonts-emoji
ASDEPS = ddcutil
HYPRPM_PLUGINS = https://github.com/hyprwm/hyprland-plugins
HYPRPM_ENABLE = hyprexpo

SHELL := /bin/bash

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

.PHONY: backup check install packages

backup:
	@echo -e "$(INFO)Backing up configs and scripts..."
	mkdir -p .config
	mkdir -p .bin
	@$(call loop_folders,cp -r $$HOME/.config/$$folder ./.config || true)
	cp -r $$HOME/.bin/. ./.bin/
	@$(call loop_files,cp $$HOME/$$file ./.config/ || true)
	@echo -e "$(OK)Backup complete."

check:
	@echo -e "$(INFO)Checking differences between home and backup..."
	@$(call loop_folders,diff -r $$HOME/.config/$$folder ./.config/$$folder --color=always | less -F)
	@$(call loop_files,diff $$HOME/$$file ./.config/$$file --color=always | less -F)

packages:
	@echo -e "$(WARN)Installing packages and Hyprpm plugins..."
	yay -S $(PACKAGES)
	yay -S --asdeps $(ASDEPS)
	@for plugin in $(HYPRPM_PLUGINS); do hyprpm add $$plugin; done
	@for enable in $(HYPRPM_ENABLE); do hyprpm enable $$enable; done
	hyprpm reload
	@echo -e "$(OK)Packages and plugins installation complete."

install:
	@read -p "$$(echo -e '$(WARN)Do you want to install the packages? (y/N): ')" choice; \
	if [[ $$choice == "y" || $$choice == "Y" ]]; then \
		$(MAKE) packages; \
	else \
		echo -e "$(ERROR)Packages installation skipped."; \
	fi
	@$(call loop_folders,cp -r ./.config/$$folder $$HOME/.config/ || true)
	cp -r ./.bin/* $$HOME/.bin/
	@$(call loop_files,cp ./.config/$$file $$HOME/$$file || true)
	@echo -e "$(OK)Install complete."
