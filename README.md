# Backend for Writings of S⌀ren Kierkegaard

Static files hosted on [silent-brad/sk](https://github.com/silent-brad/sk)

Hosted on [https://sk.knightoffaith.systems](https://sk.knightoffaith.systems)

Configuration is in `works.toml` file

### Steps to run
- Run `nix-shell --run "mix compile"` or run `nix-shell --run "./run.sh"` to run continuously
- Run `nix-shell -p static-web-server --run "static-web-server -d . -p 8080"`
- Open `http://localhost:8080`
