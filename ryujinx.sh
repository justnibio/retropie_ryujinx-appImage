#!/usr/bin/env bash

# This file is part of The RetroPie Project

rp_module_id="ryujinx"
rp_module_desc="Switch emulator Ryujinx"
rp_module_help="ROM Extensions: .xci .nsp .nro\n\nCopy your .XCI .NSP .NRO game folders to $romdir/switch\n\nDon't forget to run system firmware update first!"
rp_module_licence="MIT License https://raw.githubusercontent.com/Ryubing/Ryujinx/refs/heads/master/LICENSE.txt"
rp_module_section="exp"
rp_module_flags=""

function install_bin_ryujinx() {
    echo "Inizio il download dell'ultima versione di Ryujinx per ARM64..."
    mkdir -p "$md_inst/bin"

    # URL dell'API GitHub per la release più recente
    api_url="https://api.github.com/repos/Ryubing/Ryujinx/releases/latest"

    # Ottieni il link del file AppImage
    appimage_url=$(curl -s "$api_url" | grep -oP '(?<="browser_download_url": ")[^"]*arm64\.AppImage' | head -n 1 | tr -d '\n')

    echo "Estratto il link dal JSON dell'API: $appimage_url"

    # Verifica l'URL estratto
    if [[ -z $appimage_url ]]; then
        echo "Errore: impossibile trovare il file AppImage per ARM64."
        return 1
    fi

    echo "URL del file AppImage: $appimage_url"

    # Scarica il file
    echo "Scaricamento in corso..."
    wget "$appimage_url" -O "$md_inst/bin/ryujinx.AppImage" --verbose

    # Controlla il risultato del download
    if [[ -s "$md_inst/bin/ryujinx.AppImage" ]]; then
        echo "Download completato correttamente."
        chmod +x "$md_inst/bin/ryujinx.AppImage"
    else
        echo "Errore: il file scaricato è vuoto o inesistente."
        return 1
    fi
}



function configure_ryujinx() {
    echo "Configurazione Ryujinx..."
    mkRomDir "switch"
    addEmulator 0 "$md_id" "switch" "XINIT-WM:$md_inst/bin/ryujinx.AppImage %ROM%"
    addEmulator 1 "$md_id-nogui" "switch" "XINIT-WM:$md_inst/bin/ryujinx.AppImage --no-gui %ROM%"
    addEmulator 2 "$md_id-guionly" "switch" "XINIT-WM:$md_inst/bin/ryujinx.AppImage"
    addSystem "switch"
    echo "Configurazione completata."
}
