# Contributing

## Structure

- `bin/*`: asdf plugin functions
- `lib/dependencies.txt`: list of dependencies required for this plugin to execute and install the tool as well as the tool's dependencies.
- `lib/helpers.bash`: helper functions that are asdf-firebase specific
- `lib/utils.bash`: utility functions that are asdf-plugin agnostic

## Testing Locally

### Manual

```shell
asdf plugin remove firebase
asdf plugin add firebase .
asdf install firebase 7.15.1
```

### asdf plugin tests

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]
asdf plugin test firebase https://github.com/jthegedus/asdf-firebase.git firebase --version
```

Tests are automatically run in GitHub Actions on push and PR.
