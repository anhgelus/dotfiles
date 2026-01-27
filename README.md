# dotfiles

My dotfiles of my workstation powered by Void, ~~Sway,~~ niri, nvim and fish.

Detailled information available [on my website](https://anhgelus.world/setup) (in French).

## nvim

You can install my nvim config with:
> [!WARNING]
> This command will override your NeoVim config.
> Proceed with caution!

> [!NOTE]
> It will download the AppImage of NeoVim, put it in your home, and clone my config in your `.config/nvim`.

```bash
curl -L https://git.anhgelus.world/anhgelus/dotfiles/raw/branch/main/setup.sh | bash
```

## typst

I write simple packages for typst that are not published on their repository.
You can find their documentation in the `typst` folder.

You can install these scripts to your local repo with:
> [!WARNING]
> This command may overrides scripts installed in your local repository.
> Proceed with caution!

> [!NOTE]
> These will be available under `@local/<package>:<version>`.
> See [`typst/README.md`](./typst/README.md) for more information.
>
> If you want, you can set `@anhgelus` (or anything else) instead of `@local` by modifying `packages/local/` into
> `packages/anhgelus/`.

```bash
cp -r typst/* ${XDG_DATA_HOME:-$HOME/.local/share}/typst/packages/local/
```
