#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

menu_config_folder() {
	local MAINOPTS
    MAINOPTS=()
    MAINOPTS+=("TESTFOLDER " "This is a test folder")
    MAINOPTS+=("TESTFOLDER2 " "This is another test folder")
    
    local MAINCHOICE
    MAINCHOICE=$(whiptail --fb --clear --title "DockSTARTer" --cancel-button "Exit" --menu "What would you like to do?" 0 0 0 "${MAINOPTS[@]}" 3>&1 1>&2 2>&3 || echo "Cancel")

    case "${MAINCHOICE}" in
        "TESTFOLDER ")
            TESTFOLDER=TESTFOLDER
            ;;
        "TESTFOLDER2 ")
            TESTFOLDER=TESTFOLDER2
            ;;
        "Cancel")
            info "Exiting DockSTARTer."
            return 1
            ;;
        *)
            error "Invalid Option"
            ;;
    esac
}
