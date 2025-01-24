# Configurazione Ryujinx per Retropie

Questo aggiungerà una voce su [Retropie-Setup](https://github.com/RetroPie/RetroPie-Setup) per [l'emulatore Ryujinx](https://ryujinx-emulator.com/) in esecuzione su una macchina ARM64 (alias Raspberry).

## Requisiti

Controlla se hai già Switch elencato nel file `~/RetroPie-Setup/platforms.cfg`.

In caso contrario, crea (o modifica) il file `/opt/retropie/configs/all/platforms.cfg` e aggiungi:

```
switch_exts=".nsp"
switch_fullname="Switch"
```

## Installa

Installa lo script di installazione di Ryujinx con:

```bash
api_url="https://api.github.com/repos/Ryubing/Ryujinx/releases/latest"
appimage_url=$(curl -s "$api_url" | grep -oP '(?<="browser_download_url": ")[^"]*arm64\.AppImage')
wget --content-disposition "$appimage_url" -O "$md_inst/bin/ryujinx.AppImage"
chmod +x "$md_inst/bin/ryujinx.AppImage"
```

Ora puoi eseguire lo script **RetroPie Setup** e `ryujinx` sarà disponibile nella sezione dei pacchetti `exp` (experimental).
