# homebrew-devops ![License badge][license-img] [![Build Status][build-img]][build-url]

## Overview

Homebrew is the easiest  and most flexible way to install  the UNIX tools Apple
didn't include with macOS.

[brew.sh](https://brew.sh/)

## Description

Devops formulae for the Homebrew package manager including the following tools:

* i2cssh ([github.com/wouterdebie/i2cssh](https://github.com/wouterdebie/i2cssh/))
* drac-kvm ([github.com/PaulMaddox/drac-kvm](https://github.com/PaulMaddox/drac-kvm/))
* millipede-c ([github.com/getmillipede/millipede-c](https://github.com/getmillipede/millipede-c/))
* millipede-cpp ([github.com/getmillipede/millipede-cpp](https://github.com/getmillipede/millipede-cpp/))
* millipede-go ([github.com/getmillipede/millipede-go](https://github.com/getmillipede/millipede-go/))
* puppet-lint ([github.com/rodjek/puppet-lint](https://github.com/rodjek/puppet-lint/))
* rubocop ([github.com/bbatsov/rubocop](https://github.com/bbatsov/rubocop/))

## Usage

```bash
# Add tap
brew tap rockyluke/devops

# Install i2cssh
brew install i2cssh

# Install millipede
brew install millipede

# Install puppet-lint
brew install puppet-lint

# etc.
```

## Development

Feel free to contribute on GitHub.

```
    ╚⊙ ⊙╝
  ╚═(███)═╝
 ╚═(███)═╝
╚═(███)═╝
 ╚═(███)═╝
  ╚═(███)═╝
   ╚═(███)═╝
```

[license-img]: https://img.shields.io/badge/license-ISC-blue.svg
[build-img]: https://travis-ci.org/rockyluke/homebrew-devops.svg?branch=master
[build-url]: https://travis-ci.org/rockyluke/homebrew-devops
