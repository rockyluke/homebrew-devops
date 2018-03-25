# homebrew-devops

[![License][license-img]][license-url]
[![Build][build-img]][build-url]

## Overview

Homebrew is the easiest  and most flexible way to install  the UNIX tools Apple
didn't include with macOS.

[brew.sh](https://brew.sh/)

## Description

DevOps & SRE formulae for the  Homebrew package manager including the following
tools.

Find a complete & detailed list in [FORMULAE][formulae].

* apireaper
* bolt
* c2go
* checkipaconsistency (or cipa)
* drac-kvm
* exabgp
* flint
* git-sweep
* gitlint
* gocyclo
* golint
* hey
* i2cssh
* lunchy
* markdownlint (or mdl)
* modulesync (or msync)
* monitoringreporter
* pup
* puppet-lint
* pycodestyle
* pydocstyle
* pylint
* pyupio (or pyup)
* rubocop
* sup
* travis
* yaml-lint
* yamllint

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

# Install pylint
brew install pylint

# etc.
```

## Development

Feel free to contribute on GitHub.

## Miscellaneous

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
[license-url]: LICENSE
[build-img]: https://travis-ci.org/rockyluke/homebrew-devops.svg?branch=master
[build-url]: https://travis-ci.org/rockyluke/homebrew-devops
[formulae]: https://github.com/rockyluke/homebrew-devops/blob/master/FORMULAE.md
