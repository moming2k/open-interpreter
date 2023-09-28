#!/usr/bin/env bash

# This script assist the installation of Open Interpreter.
# It detects the current operating system architecture and check if the user has required tools.
# If user enabled the local augments, it will check if the GPU library installed. If not, it will install the GPU
# version of llama if possible.
# If not specified, it will install the OpenAI compatible version.

shopt -s extglob
set -o errtrace
set -o errexit
set -o pipefail

{ # this ensures the entire script is downloaded #

#
# Check whether the user has already installed open-interpreter in their system
# and warn them if so.
#
oi_check_installation() {
  local OI_COMMAND

  # check if the open-interpreter has already installed
  OI_COMMAND="$(command -v interpreter)"
  if [ -n "$OI_COMMAND" ]; then
    oi_echo "You already have open-interpreter installed."
    oi_echo "You'll need to remove open-interpreter if you want to re-install."
    oi_echo "You can use the following command to remove open-interpreter:"
    oi_echo ""
    oi_echo "pip uninstall open-interpreter"
    oi_echo ""
    return 0
  fi
}

oi_check_environment() {
    # Check if the current environment is under conda, venv, or virtualenv
    # If it is not, then recommend user to install conda before go on.

    # Check for conda environment
    if command -v conda &> /dev/null
    then
        echo "Conda environment detected."
    # Check for venv or virtualenv
    elif [[ -n "$VIRTUAL_ENV" ]]
    then
        echo "Virtual environment detected."
    else
        echo "No virtual or conda environment detected."
        echo "It's recommended to install conda before proceeding."
    fi
}

oi_echo() {
  command printf %s\\n "$*" 2>/dev/null
}

oi_install() {
  oi_check_installation
  oi_check_environment
#  oi_install_initialize
#  oi_install_commands_setup
#  oi_install_default_settings
#  oi_install_parse_params "$@"
#  oi_install_validate_oi_path
#  oi_install_validate_volume_mount_mode
#  oi_install_select_and_get_version
#  oi_install_main
#  oi_install_ruby_and_gems
}




} # this ensures the entire script is downloaded #

oi_install "$@"