<div align="center">

# asdf-firebase ![Build](https://github.com/jthegedus/asdf-firebase/workflows/Build/badge.svg) ![Lint](https://github.com/jthegedus/asdf-firebase/workflows/Lint/badge.svg) [![Mentioned in Awesome Firebase](https://awesome.re/mentioned-badge.svg)](https://github.com/jthegedus/awesome-firebase)

[Firebase CLI](https://firebase.google.com/) [(firebase-tools)](https://github.com/firebase/firebase-tools) plugin for [asdf version manager](https://asdf-vm.com). Manage your Firebase CLI without Node.js or npm! Great for `python`, `golang`, `c++` & `java` Firebase projects.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `git`, `sed`, `grep`, `cut`, `curl`, `uname`, `awk`, `xargs`

# Install

Plugin:

```shell
# prefer the git url method
asdf plugin add https://github.com/jthegedus/asdf-firebase.git
# or
asdf plugin add firebase
```

Install [`firebase-tools`](https://github.com/firebase/firebase-tools):

```shell
asdf install firebase 7.15.1
```

Set global version:

```shell
asdf global firebase 7.15.1
```

See `.tool-versions` configuration in the [asdf](https://asdf-vm.com/#/core-configuration?id=tool-versions) documentation to manage all your project's tools in one place!

# Why?

`firebase-tools` is a CLI tool for all Firebase projects, regardless of language. To date, the methods for installation have been downloading the CLI from the Firebase website or through `npm`, with `npm` being the primary method advertised.

With `asdf` and the `asdf-firebase` plugin, users/teams of any Firebase project can install and pin the version of the Firebase CLI without needing to manage Node.js or `npm`!

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/jthegedus/asdf-firebase/graphs/contributors)!

# License

[MIT License](LICENSE) © [James Hegedus](https://github.com/jthegedus/)
