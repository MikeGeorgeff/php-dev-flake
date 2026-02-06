# php-dev-flake

Shared Nix flake that provides PHP development shells. Reference this flake to get consistent PHP environments without managing versions or extensions locally.

## Dev Shells

| Shell   | PHP Version | Included Extensions |
| ------- | ----------- | ------------------- |
| `php82` | 8.2         | Default             |
| `php84` | 8.4         | Default             |

Each shell includes PHP and Composer.

## Usage

### In a package flake

Packages re-export the dev shells from this flake:

```nix
{
  inputs = {
    php-dev.url = "github:MikeGeorgeff/php-dev-flake";
  };

  outputs = { self, php-dev }:
  {
    devShells = php-dev.devShells;
  };
}
```

### Running commands

Enter a shell interactively:

```
nix develop .#php82
```

Run a command against a specific PHP version:

```
nix develop .#php82 --command composer test
nix develop .#php84 --command composer analyze
```

### Updating

To pull in new PHP versions or extension changes, run `nix flake update` in the consuming package.

## License

MIT
