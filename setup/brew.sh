#!/bin/bash

# Get the directory of the current script
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Include the functions file
source "$script_dir/prompt-functions.sh"

# First check that homebrew is installed to urn and exit as early as possible.
if ! command -v brew &> /dev/null; then
    echo "🧙‍♀️ You must first install homebrew: https://brew.sh/"
    tput bel
    exit 1
fi

function brew_init {

    echo "> Running brew's update, upgrade, cleanup, and doctor before proceeding (aka. brewup)"

    # First run some brew housekeeping
    brew update
    brew upgrade
    brew cleanup
    brew doctor

    # Install xcode CLI cause not having it tends to throw errors.
    if ! command -v xcode-select &> /dev/null; then
        echo "> install xcode"
        xcode-select --install
    fi
}

function brew_exit {
    echo "Cancelling all brew install processes."
    exit 1
}

function fonts_callback {
    # Fonts used in IDE and terminals.
    brew tap homebrew/cask-fonts
    brew install --cask font-jetbrains-mono
    brew install --cask font-jetbrains-mono-nerd-font
    brew install --cask font-fira-code-nerd-font
    brew install --cask font-hack-nerd-font
}


function application_callback {

    # Applications I've installed in the past
    # - little-snitch
    # - cyberduck
    # - iterm2
    # - mysqlworkbench
    # - charles
    # - dash

    # List of brew packages
    application_list=("timemachineeditor" "db-browser-for-sqlite");

    # Loop through the array elements
    for brew_package in "${application_list[@]}"; do
        application_name=$brew_package

        # Remap packages that use an application name different from the package name
        if [[ $brew_package == "db-browser-for-sqlite" ]]; then
            application_name="DB Browser for SQLite"
        fi

        application_path="/Applications/$application_name.app"
        # Check if the application bundle exists
        if [ -d "$application_path" ]; then
            echo "> $application_name is installed. Skipping."
        else
            brew install --cask --appdir="/Applications" $brew_package
        fi
    done
}

function cli_commands_callback {

    # List of brew packages
    package_list=("jq" "git" "imagemagick" "exiftool" "tree" "wget");

    # Loop through the array elements
    for brew_package in "${package_list[@]}"; do
        cli_command=$brew_package

        # Remap packages that use a CLI command different than the package name
        if [[ $brew_package == "imagemagick" ]]; then
            cli_command="magick"
        fi

        # Check if command is installed
        if  command -v ${cli_command} &> /dev/null; then
            echo "> ${brew_package} already installed. Skipping."
        else
            echo "> Installing ${brew_package}"
            brew install ${brew_package}
        fi
    done
}

function php_callback {

    # Check if composer is installed
    if  command -v composer &> /dev/null; then
        echo "> composer already installed. Skipping."
    else
        echo "> Installing composer"
        brew install composer
    fi

    # Check if php is installed; may have installed as a dependency of Composer
    if  command -v php &> /dev/null; then
        echo "> php already installed. Skipping."
    else
        brew install php
    fi
}

prompt_yes_no_both "🙋 Do you want to interactively install brew formulae and casks?" brew_init brew_exit

prompt_yes_no "❓ Do you want to install favorite CLI commands?" cli_commands_callback
prompt_yes_no "❓ Do you want to install brew fonts?" fonts_callback
prompt_yes_no "❓ Do you want to install php things?" php_callback
prompt_yes_no "❓ Do you want to install applications?" application_callback
