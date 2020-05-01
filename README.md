Dotfiles
========

My dotfiles use [dotbot][dotbot] for installation and are based strongly on [Anish Athalye's][anish] [dotfiles][anish-dotfiles].

To use, just run `git clone https://github.com/Rylan12/dotfiles.git && cd dotfiles && ./install`

Making Local Customizations
---------------------------

You can make local customizations for some programs by editing these files:

- `git`: `~/.gitconfig_local`
- `vim`: `~/.vimrc_local`
- all shells: `~/.shell_local_before` or `~/.shell_local_after`
- `bash`: `~/.bashrc_local_before` or `~/.bashrc_local_after`
- `zsh`: `~/.zshrc_local_before` `~/.zshrc_local_after`

[dotbot]: https://github.com/anishathalye/dotbot
[anish]: https://github.com/anishathalye
[anish-dotfiles]: https://github.com/anishathalye/dotfiles
