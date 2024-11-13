# stuff to take in mind
- this has to be placed on `/users/[user]/` otherwise it wont work

# For the lazy people
- run with `./setup_dotfiles.sh`
- after running warp theme stills need to be set on gui


# Installing it manually
- Install, warp, yabai, oh-my-zsh, sketchybar, fastfetch, nvim, tmux, and skhd
- Download and install the SF symbols from the apple developer [website](https://developer.apple.com/sf-symbols/) for the symbols to show up on sketchybar.
- Install GeistMono nerd font mono from homebrew using `brew install --cask font-geist-mono-nerd-font`
- In your home folder make a .warp folder and copy the themes folder from the dotfiles for warp themes to show up on warp(If they don't quit and reopen warp).
- Next, in the .config folder in your home directory(Should already be there if it isn't make a one with name as `.config`) copy the yabai folder from the dotfiles to here and make sure you replace the old one.
- Do the same for the sketchybar folder
- Run  `yabai --stop-service` then `yabai --stop-service`
- Also run `sketchybar --reload`
- Lastly for fastfetch, make a fastfetch folder within the .config folder used previously. Next, paste in all the contents of the fastfetch folder from the dotfiles folder.
- Restart, and voila!
