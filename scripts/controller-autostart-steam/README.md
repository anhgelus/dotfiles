# Controller autostart Steam

Autostart Steam when my controller is plugged.

Set power profile to `performance` and go back to `power-saving` when Steam is closed.

## Installing

Copy `,controller-add` and `,start-steam` in `$HOME/.local/bin`.

Copy `99-controller-autostart-steam.rules` in `/etc/udev/rules.d/` and change:
- `anhgelus` by your UNIX username
- `0e6f` by the vendor ID of your controller (displayed by `lsusb`)
- `0413` by the product ID of your controller (displayed by `lsusb`)

See below if you don't know how to get these IDs.

Copy `controller-steam.service` in `$HOME/.config/systemd/user/` and change:
- `anhgelus` by your UNIX username

Copy `controller-autostart-steam.env` in `$HOME/.config`.

Reload udev rules:
```bash
sudo udevadm control --reload-rules && sudo udevadm trigger
```

Reload systemd:
```bash
systemctl --user daemon-reload
```

You can modify the location of the lockfile by editing `lockfile` variable in
`$HOME/.config/controller-autostart-steam.env`.

You can modify the power profile by editing in the same file:
- `perf_inside` variable when Steam is launched
- `perf_outside` variable when Steam is closed

### How to get required IDs of your controller?

Plug your controller and run:
```bash
lsusb
```
It will list hardwares connected to your computer via a USB port.

My controller is this one:
```
Bus 003 Device 011: ID 0e6f:0413 Logic3 Afterglow AX.1 Gamepad for Xbox 360
```

Its identifier is `0e6f:0413`, where `0e6f` is its vendor ID and `0413` is its product ID.
