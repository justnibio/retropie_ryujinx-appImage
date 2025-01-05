#!/usr/bin/env bash

rp_module_id="rpcs3-appImage"
rp_module_desc="PS3 emulator RPCS3"
rp_module_help="ROM Extensions: .ps3\n\nCopy your .PS3 game folders to $romdir/ps3\n\nDon't forget to run system firmware update first!"
rp_module_licence="GPL2 https://raw.githubusercontent.com/RPCS3/rpcs3/master/LICENSE"
rp_module_section="exp"
rp_module_flags=""
rp_module_repo="file https://api.github.com/repos/RPCS3/rpcs3-binaries-linux-arm64/releases/latest"

function download_latest_rpcs3() {
    echo "Inizio il download dell'ultima versione di RPCS3 per ARM64..."

    # URL dell'API GitHub per la release
    api_url="https://api.github.com/repos/RPCS3/rpcs3-binaries-linux-arm64/releases/latest"

    echo "Recupero del link al file AppImage tramite API..."
    appimage_url=$(curl -s "$api_url" | grep -oP '(?<="browser_download_url": ")[^"]*\.AppImage')

    if [[ -z $appimage_url ]]; then
        echo "Errore: non    stato trovato alcun file AppImage tramite API."
        return 1
    fi

    echo "URL del file AppImage: $appimage_url"

    echo "Download del file AppImage in corso..."
    wget --content-disposition "$appimage_url" -O "$md_inst/bin/rpcs3.AppImage"

    if [[ $? -ne 0 ]]; then
        echo "Errore durante il download del file AppImage."
        return 1
    fi

    echo "Download completato: rpcs3.AppImage"
}


function install_bin_rpcs3-appImage() {
    echo "Inizio installazione RPCS3"
    mkdir -p "$md_inst/bin"

    # Chiamata alla funzione principale
    download_latest_rpcs3

    chmod +x "$md_inst/bin/rpcs3.AppImage"
    echo "Installazione completata"
}

function configure_rpcs3-appImage() {
    echo "Inizio configurazione RPCS3"
    mkRomDir "ps3"
    addEmulator 0 "$md_id" "ps3" "$md_inst/bin/rpcs3.AppImage %ROM%/PS3_GAME/USRDIR/EBOOT.BIN"
    addEmulator 1 "$md_id-nogui" "ps3" "$md_inst/bin/rpcs3.AppImage --no-gui %ROM%/PS3_GAME/USRDIR/EBOOT.BIN"
    addEmulator 2 "$md_id-guionly" "ps3" "$md_inst/bin/rpcs3.AppImage"
    addSystem "ps3"
    echo "Configurazione completata"
}

