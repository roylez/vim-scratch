# vim-scratch

This plugin facilitates the use of Vim as a scratchpad, primarily intended for composing ad-hoc text, such as forum posts and comments.

It provides the following features:

- When the `:Scratch` command is invoked, a temporary file is created in `/tmp` with a filename in the format `YYYYMMDD.HHMMSS.scratch`.
- Spelling checking is enabled.
- The Vim file type of the scratch buffer is set to `markdown.scratch`, enabling markdown syntax highlighting.
- Whenever the file is saved, using either the `:w` or `ZZ` command, the entire buffer content is copied to the system clipboard, allowing for easy pasting elsewhere.
- Upon closing the buffer or exiting Vim, the temporary file is deleted.

### Tips

- The `ScratchClip` command is also available, which loads the clipboard content into the scratch buffer at startup.
- It is recommended to set up a key binding to a command like `vim +Scratch` to ensure the scratchpad is always accessible when needed.

