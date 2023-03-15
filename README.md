# dotfiles

This is my personnal dotfiles.

## Installation

To install the dotfiles, follow this steps:

1. Clone the repo
```bash
git clone https://github.com/anhgelus/dotfiles.git
```
2. Go inside the new dotfiles folder
3. Run the install.sh
```bash
sh install.sh
```
4. Put your desktop wallpaper inside `~/Images/wallpapers/wallpaper.jpg` and your LightDM wallpaper inside `/usr/share/anhgelus/lightdm-wallpaper.jpg`
5. Restart and it works!


## Versioning

The versioning of this repository do not follow the semver because the semver is just useless for this usage.

Every tag of this repository must follow these guidelines:
1. DD[.patch]-month-YYYY
2. "[\*]" is not a required part
3. "DD" is for the day (number)
4. "path" is for the path number
5. "month" is for the month (full letters)
6. "YYYY" is for the year (number"

`15.1-march-2023` is for the second version of the 03/15/2023 (MM-DD-YYYY) or 15/03/2023 (DD-MM-YYYY)

## Technologies

> WM: `i3`
>
> Lockscreen: `LightDM`
>
> OS: `EndeavourOs`
>
> Packet Manager: `yay`, `flatpak` and `snap`
>
> Other: `picom jonaburg_fix` ([here](https://github.com/Arian8j2/picom-jonaburg-fix)), `polybar` and `rofi`
