# RPCS3 Setup for Retropie

This will add an entry on [Retropie-Setup](https://github.com/RetroPie/RetroPie-Setup) for [Ryujinx emulator](https://ryujinx-emulator.com/) running on a ARM64 (aka Raspberry) machine.

## Requirements

Check if you have Switch already listed in file `~/RetroPie-Setup/platforms.cfg`.

If not, create (or edit) file `/opt/retropie/configs/all/platforms.cfg` and add:

```
switch_exts=".nsp"
switch_fullname="Switch"
```

## Install

After that, install the Ryujinx setup script with:

```bash
api_url="https://api.github.com/repos/Ryubing/Ryujinx/releases/latest"
appimage_url=$(curl -s "$api_url" | grep -oP '(?<="browser_download_url": ")[^"]*arm64\.AppImage')
wget --content-disposition "$appimage_url" -O "$md_inst/bin/ryujinx.AppImage"
chmod +x "$md_inst/bin/ryujinx.AppImage"
```

Now you can run **RetroPie Setup** script and `ryujinx` will available under `exp` (experimental) packages section.

