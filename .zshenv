source ~/.exports

# Setup for Nix
if [ -e /Users/ashvin/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/ashvin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$PATH:/Users/ashvin/.foundry/bin"
. "$HOME/.cargo/env"
