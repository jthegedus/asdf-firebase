<div align="center">

# asdf-firebase ![Build](https://github.com/jthegedus/asdf-firebase/workflows/Build/badge.svg) ![Lint](https://github.com/jthegedus/asdf-firebase/workflows/Lint/badge.svg)

[Firebase CLI (firebase-tools)](https://firebase.google.com/) plugin for [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`

# Install

Plugin:

```shell
asdf plugin add firebase
# or
asdf plugin add https://github.com/jthegedus/asdf-firebase.git
```

firebase:

```shell
asdf install firebase 7.15.0
```

Set global version:

```shell
asdf global firebase 7.15.0
```

# Why?

The asdf config file, `.tool-versions`, allows pinning each tool in your project to a specific version. This ensures that ALL developers are using the same version of each tool. Same `python`, same `ruby`, same `gcloud`, same `terraform` etc.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/jthegedus/asdf-firebase/graphs/contributors)!

# License

[MIT License](LICENSE) © [James Hegedus](https://github.com/jthegedus/)
