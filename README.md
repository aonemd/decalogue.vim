<div align="center">
  <h1>
    decalogue.vim
  </h1>
</div>

State your commandments and run them from a menu.

### Installation

Install `aonemd/decalogue.vim` using a plugin manger such as:
[vim-plug](https://github.com/junegunn/vim-plug),
[NeoBundle](https://github.com/Shougo/neobundle.vim),
[Vundle](https://github.com/gmarik/Vundle.vim), or
[Pathogen](https://github.com/tpope/vim-pathogen).

### Usage

- Define your commandments in your `~/.vimrc`:
  ```viml
    let g:decalogue_commandments = {
          \ 'Git status': '!git status',          "shell command
          \ 'Git push': '!git push origin HEAD',
          \ 'Rust test': 'term cargo t',          "vim command
          \ 'Rust check': 'term cargo c',
          \ }
  ```
- `decalogue.vim` defines two Vim commands: `Decalogue` and `DecalogueSilent`. They can be used through key maps:
    * run commands in the foreground using: `<leader>dc`
    * run commands in the background (silently) using: `<leader>ds`
- `decalogue.vim` also defines a general Vim command to run anything in silently:
    ```viml
    DecalogueRunSilent echo "hello world"
    ```
    and can be triggered through the key map `<leader>dr`

### Customization

All commands can be set to customized key maps:
- `Decalogue` command through:
    ```
    let g:decalogue_command = 'key'
    ```
- `DecalogueSilent` command through:
    ```
    let g:decalogue_command_silent = 'key'
    ```
- `DecalogueRunSilent` command through:
    ```
    let g:decalogue_command_run_silent = 'key'
    ```

### License

See [LICENSE](https://github.com/aonemd/decalogue.vim/blob/master/LICENSE).
