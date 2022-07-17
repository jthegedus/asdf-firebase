# Contributing

## Setup

1. `git clone https://github.com/jthegedus/asdf-v.git`
1. ```
   asdf plugin add deno https://github.com/asdf-community/asdf-deno.git
   asdf plugin add bats https://github.com/timgluz/asdf-bats.git
   asdf plugin add shellcheck https://github.com/luizm/asdf-shellcheck.git
   asdf plugin add shfmt https://github.com/luizm/asdf-shfmt.git
   ```
1. `asdf install`

## Structure

- `bin/*`: asdf plugin functions
- `lib/dependencies.txt`: list of dependencies required for this plugin to
  execute and install the tool as well as the tool's dependencies.
- `lib/envs.bash`: environment variables for install, use and testing of the
  plugin

## Testing Locally

### Manual

```shell
asdf plugin remove firebase
asdf plugin add firebase .
asdf install firebase 11.2.2
```

### asdf tests

Two types of testing are used. Bats tests under the `test/` dir and asdf
specific integration tests with `asdf plugin test`.

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]
asdf plugin test v https://github.com/jthegedus/asdf-v.git v --version
```

Tests are automatically run in GitHub Actions on push and PR.
