# zsh Config

This config is being handled using [`zinit`](https://github.com/zdharma-continuum/zinit)
The only thing you have to do is copy (or link) `.zshrc` and `.zsh_alias` to your home directory.
All the rest will be downloaded and setup for you!

> [!TIP]
> Check out [this video](https://www.youtube.com/watch?v=ud7YxC33Z3w) for a more in depth explanation of `zinit`.

To update the binaries and plugins, run:

```sh
zinit update --parallel
```

## Tools

### zsh plugins

- `zsh-users/zsh-syntax-highlighting`: adds syntax highlighting to the command line.
- `zsh-users/zsh-completions`: provides additional completions for various commands.
- `zsh-users/zsh-autosuggestions`: provides command line suggestions based on history and completions.
- `MichaelAquilina/zsh-auto-notify`: notifies you when a background job finishes.
- `Aloxaf/fzf-tab`: provides fuzzy completion for commands, files, and directories on tab.

- Snippets from `oh-my-zsh`:
    - `OMZP::git`: provides many git aliases and helper functions.
    - `OMZP::sudo`: easily prepends `sudo` to the current command by pressing `ESC` twice.
    - `OMZP::command-not-found`: suggests packages to install when a command is not found.

### [starship](https://starship.rs/)

Starship is a cross-shell prompt.

[Themes presets](https://starship.rs/presets/)

![starship preview](https://raw.githubusercontent.com/starship/starship/master/media/demo.gif)

> [!WARNING]
> Don't forget to install a [Nerd Font](https://www.nerdfonts.com/) to use the icons in the prompt.

### [fzf](https://github.com/junegunn/fzf)

fzf a is command-line fuzzy finder.

![fzf preview](https://raw.githubusercontent.com/junegunn/i/master/fzf-preview.png)

### [zoxide](https://github.com/ajeetdsouza/zoxide)

zoxide is a smart cd command. It remembers your most used directories and allows you to quickly navigate to them.

![zoxide preview](https://github.com/ajeetdsouza/zoxide/raw/main/contrib/tutorial.webp)

### [eza](https://github.com/eza-community/eza)

Modern alternative to `ls`, with icons and other integration.

![eza preview](https://github.com/eza-community/eza/raw/main/docs/images/screenshots.png)

### [ripgrep](https://github.com/BurntSushi/ripgrep)

`grep` on steroids.

![rg preview](https://burntsushi.net/stuff/ripgrep1.png)

### [bat](https://github.com/sharkdp/bat)

`cat` clone with syntax highlighting and Git integration.

![bat preview](https://camo.githubusercontent.com/a9789c5200bdb0a22602643d7bf85f0f424ddd4259e763abc865609010c5e228/68747470733a2f2f696d6775722e636f6d2f724773646e44652e706e67)

### [delta](https://github.com/dandavison/delta)

Syntax-highlighting pager for git and diff output

![delta preview](https://user-images.githubusercontent.com/52205/86275526-76792100-bba1-11ea-9e78-6be9baa80b29.png)

Install it by updating `~/.gitconfig` like so:

```gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true  # use n and N to move between diff sections
    dark = true      # or light = true, or omit for auto-detection

[merge]
    conflictstyle = zdiff3
```

Or by running:

```sh
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global merge.conflictStyle zdiff3
```

> [!WARNING]
> `zdiff3` only works with the latest versions of git.

