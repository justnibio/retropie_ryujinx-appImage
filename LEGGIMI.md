# Configurazione di RPCS3 per Retropie

Questo aggiungerà una voce su [Retropie-Setup](https://github.com/RetroPie/RetroPie-Setup) per [RPCS3 emulator](https://rpcs3.net) in esecuzione su una macchina ARM64 (aka Raspberry).

## Requisiti

Controlla se hai PS3 già elencato nel file `~/RetroPie-Setup/platforms.cfg`.

In caso contrario, creare (o modificare) il file: `/opt/retropie/configs/all/platforms.cfg` e aggiungere:

```
ps3_exts=".ps3"
ps3_fullname="PlayStation 3"
```

## Install

Successivamente, installa lo script di RPCS3 con::

```bash
sudo wget https://github.com/RPCS3/rpcs3-binaries-linux-arm64/releases/download/build-ff0249d662fcedee602c9206e73b5feb91f164c1/rpcs3-v0.0.34-17222-ff0249d6_linux_aarch64.AppImage -O "$md_inst/bin/rpcs3.AppImage"
```

Ora puoi eseguire lo script **RetroPie Setup** and `rpcs3` sarà disponibile nella sezione `exp` (experimental).

## Cartella giochi

Dopo aver scaricato il tuo gioco PS3 originale, sposta il contenuto del gioco in una cartella con un'estensione `.PS3` sotto `~/RetroPie/roms/ps3/`.

Esempio: se il tuo gioco è `Skate3`, metti il contenuto sotto `~/RetroPie/roms/ps3/Skate3.PS3/`

## Giochi PSN 

I Giochi PSN usano l'estensione `.pkg`.

### Install

Apri  RPCS3: da un terminale, esegui `/opt/retropie/emulators/rpcs3/bin/rpcs3.AppImage`.

Quindi, nel menu RPCS3, seleziona `File` > `Install .pkg`.

Sfoglia e seleziona il contenuto `.pkg` da eseguire.

### EmulationStation

Per creare una voce per il gioco PSN, prendi nota del **numero seriale** (puoi copiare il numero di serie del gioco sull'interfaccia utente di RPCS3, facendo clic con il pulsante destro del mouse nel gioco selezionando "Copy info" > "Copy game serial").

Quindi crea una cartella per il tuo gioco con un'estensione `.PS3` sotto `~/RetroPie/roms/ps3/` (ricordati di sostituire il **nome del gioco** con il vero nome di gioco):

    mkdir ~/RetroPie/roms/ps3/<sostituisci-con-il-nome-del-tuo-gioco>.PS3

Crea un collegamento dalla memoria interna della PS3 al `~/RetroPie/roms/ps3/` (ricordati di sostituire il **numero seriale** e il **nome del gioco** con i valori effettivi del tuo gioco):

    ln -sf  ~/.config/rpcs3/dev_hdd0/game/<numero-seriale> ~/RetroPie/roms/ps3/<sostituisci-con-il-nome-del-tuo-gioco>.PS3/PS3_GAME

## Per Giocare

Controlla [RPCS3 Quick Start guide](https://rpcs3.net/quickstart).
