# My Emacs Configuration

A modern, modular Emacs configuration optimized for macOS with a focus on productivity and clean aesthetics.

## Overview

This Emacs configuration is designed to provide a streamlined, efficient development environment with a minimal yet functional interface. It's built with modularity in mind, separating concerns into different configuration files for better maintainability.

## Features

- **Clean Interface**: Minimal UI with no menu bar, tool bar, or scroll bars
- **Modern Font**: Uses Menlo font (14pt) by default
- **Quality of Life Improvements**:
  - UTF-8 encoding
  - Auto-revert mode
  - Electric pair mode
  - Show paren mode
  - Column number display
- **Modular Configuration**: Separate files for:
  - Package management (`packages.el`)
  - Programming configurations (`programming.el`)
  - Appearance settings (`appearance.el`)
  - Key bindings (`key-bindings.el`)

## Requirements

- Emacs 28 or later
- macOS (optimized for Darwin systems)

## Installation

1. Clone this repository to your Emacs configuration directory:
   ```bash
   git clone <repository-url> ~/.config/emacs
   ```

2. Start Emacs and let it initialize the configuration

## Configuration Structure

- `init.el`: Main configuration file that bootstraps Emacs
- `packages.el`: Package management and installation
- `programming.el`: Programming-related configurations
- `appearance.el`: UI and appearance settings
- `key-bindings.el`: Custom key bindings
- `custom.el`: Automatically generated customizations

## Customization

The configuration is designed to be easily customizable. You can modify the following variables in `init.el`:

- `my/default-font`: Default font family
- `my/default-font-size`: Default font size (in 1/10pt)

## License

[MIT License](https://github.com/omaciel/emacs/blob/main/LICENSE)

## Author

Og Maciel <og@maciel.com> 
