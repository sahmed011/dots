{
  pkgs,
  host,
  username,
  ...
}:
pkgs.writeShellScriptBin "themechange" ''
  if [[ ! $@ ]];then
    echo "No Theme Given"
  else
    replacement="$1"
    sed -i "/^\s*theme[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$replacement\"/" /home/${username}/dots/hosts/${host}/variables.nix
    kitty -e pkexec nixos-rebuild switch --flake /home/${username}/dots
  fi
''
