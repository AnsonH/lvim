# LunarVim Config

My [LunarVim](https://www.lunarvim.org/) configuration.

## Initial Set-Up

1. Run the [LunarVim installation command](https://www.lunarvim.org/docs/installation#release)
   1. It will generate a file in `~/.config/lvim/plugin/packer_compiled.lua`. Do **NOT** delete this file or LunarVim will break completely.
2. Run the following commands. This moves the compiled `packer_compiled.lua` file to the newly cloned repo.
   ```sh
   mv ~/.config/lvim ~/.config/lvim-tmp
   git clone https://github.com/AnsonH/lvim.git .config/lvim
   mv ~/.config/lvim-tmp/plugin ~/.config/lvim
   rm -r ~/.config/lvim-tmp
   ```
3. Install custom Packer plugins:
   1. Run `lvim` in Terminal
   2. Press `c` to open configuration. You should the config coming from this repo
   3. Save the `config.lua` file. It will trigger an auto-command to install the remaining Packer plugins
4. Authenticate GitHub Copilot with `:Copilot auth`.
   > **Note** It may take 10~20 secs before Copilot start generating inline suggestions. Be patient!
5. Authenticate [Wakatime](https://wakatime.com/) with `:WakaTimeApiKey`.
