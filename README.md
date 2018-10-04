# mode-switch.CLI
This is a `zsh-plugin` for switching command line between normal mode and vi mode.

# Usage
Download this repository, cd into `mode-switch.CLI` and then run the `install.sh`.

- Normal mode

The default mode is the `normal mode`, in this mode we can use shortcuts like `ctrl+a` for begin-of-line.

![normal_mode](https://github.com/Gyumeijie/assets/blob/master/mode-switch.CLI/normal_mode.png)

- VI mode

We can strike **Alt + t** to switch normal mode to vi mode and vice verse.

![vi_mode](https://github.com/Gyumeijie/assets/blob/master/mode-switch.CLI/vi_mode.png)

If you familiarize with vi editor, you should know that there are two modes in vi - the `command mode` and the `insert mode`. And the default mode in vi is the command mode. But in our plugin, when we first enter into the `vi mode`, we are actually in insert mode, using the **escape key** to switch from insert mode to command mode, and typing keys such as `i` in  command mode can bring us back to the insert mode.

![vi_command](https://github.com/Gyumeijie/assets/blob/master/mode-switch.CLI/vi_command.png)
