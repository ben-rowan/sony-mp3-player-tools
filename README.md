# sony-mp3-player-tools

I recently bought a Sony NWZ-B183 mp3 player and I've had a challenging time getting it to
work reliably on Linux. This repo contains the set of 'tools' that I've built up while getting it
to work properly.

## Setup

Auto mounting has been hit and miss. Because of this a custom mount point and
entry in `fstab` are preferable. This means we can manually `mount` and `umount` the mp3 player
as needed.

```bash
# First we need to get the label for the mp3 players partition. This can then be used in fstab
# in place of /dev/<partition> making things more robust.
# You can list all block devices using lsblk to get the correct /dev/<partition> value.
sudo bash mounting/setup/get_partition_label.bash /dev/<partition>;
# Now we setup our mount point and fstab entry
sudo bash mounting/setup/setup.bash [partition label]
```

## Usage

You can now use the mounting and syncing tools as your regular user to manage your mp3 player.

### Mount

To `mount` the mp3 player we use:

```bash
bash mounting/mount.bash [partition label (defaults to 'WALKMAN')]
```

### Umount

To `umount` the mp3 player we use:

```bash
bash mounting/umount.bash
```

### Sync Media

To synchronise media on the mp3 player with media on your PC you can use:

```bash
bash transferring/sync.bash /path/to/media/files/on/pc path/on/mp3/player
```

Note: the path on the media player is taken from `/media/<user>/WALKMAN/`.

## Alias

To make things a little nicer I've created the following aliases for myself:

```bash
alias sony_mount='bash /path/to/repo/sony-mp3-player-tools/mounting/mount.bash';
alias sony_umount='bash /path/to/repo/sony-mp3-player-tools/mounting/umount.bash';
alias sony_sync_music='bash /path/to/repo/sony-mp3-player-tools/transferring/sync.bash /path/to/music/ MUSIC/'
alias sony_sync_podcasts='bash /path/to/repo/sony-mp3-player-tools/transferring/sync.bash /path/to/podcasts/ PODCAST/'
```
