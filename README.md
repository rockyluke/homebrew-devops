# homebrew-devops ![License badge][license-img] [![Build Status][build-img]][build-url] [![Codacy Status][codacy-img]][codacy-url]

## Overview

Homebrew is the easiest  and most flexible way to install  the UNIX tools Apple
didn't include with macOS.

[brew.sh](https://brew.sh/)

## Description

Devops formulae for the Homebrew package manager including the following tools:

* apireaper ([github.com/vp-noc/apireaper](https://github.com/vp-noc/apireaper/))
* bolt ([github.com/puppetlabs/bolt](https://github.com/puppetlabs/bolt/))
* c2go ([github.com/elliotchance/c2go](https://github.com/elliotchance/c2go/))
* drac-kvm ([github.com/paulmaddox/drac-kvm](https://github.com/paulmaddox/drac-kvm/))
* exabgp ([github.com/exa-networks/exabgp](https://github.com/exa-networks/exabgp/))
* flint ([github.com/pengwynn/flint](https://github.com/pengwynn/flint/))
* git-sweep ([github.com/arc90/git-sweep](https://github.com/arc90/git-sweep/))
* gitlint ([github.com/jorisroovers/gitlint](https://github.com/jorisroovers/gitlint/))
* gocyclo ([github.com/fzipp/gocyclo](https://github.com/fzipp/gocyclo/))
* golint ([github.com/golang/lint](https://github.com/golang/lint/))
* hey ([github.com/rakyll/hey](https://github.com/rakyll/hey/))
* i2cssh ([github.com/wouterdebie/i2cssh](https://github.com/wouterdebie/i2cssh/))
* lunchy ([github.com/eddiezane/lunchy](https://github.com/eddiezane/lunchy/))
* markdownlint (or mdl) ([github.com/mivok/markdownlint](https://github.com/mivok/markdownlint/))
* millipede-c ([github.com/getmillipede/millipede-c](https://github.com/getmillipede/millipede-c/))
* millipede-cpp ([github.com/getmillipede/millipede-cpp](https://github.com/getmillipede/millipede-cpp/))
* millipede-go ([github.com/getmillipede/millipede-go](https://github.com/getmillipede/millipede-go/))
* millipede-python ([github.com/getmillipede/millipede-python](https://github.com/getmillipede/millipede-python/))
* modulesync ([github.com/voxpupuli/modulesync](https://github.com/voxpupuli/modulesync/))
* monitoringreporter ([github.com/vp-noc/monitoringreporter](https://github.com/vp-noc/monitoringreporter/))
* pup ([github.com/ericchiang/pup](https://github.com/ericchiang/pup/))
* puppet-lint ([github.com/rodjek/puppet-lint](https://github.com/rodjek/puppet-lint/))
* pycodestyle ([github.com/pycqa/pycodestyle](https://github.com/pycqa/pycodestyle/))
* pydocstyle ([github.com/pycqa/pydocstyle](https://github.com/pycqa/pydocstyle/))
* pylint ([github.com/pycqa/pylint](https://github.com/pycqa/pylint/))
* pyupio ([github.com/pyupio/pyup](https://github.com/pyupio/pyup/))
* rubocop ([github.com/bbatsov/rubocop](https://github.com/bbatsov/rubocop/))
* sup([github.com/sup-heliotrope/sup](https://github.com/sup-heliotrope/sup/))
* whereami ([github.com/kootenpv/whereami](https://github.com/kootenpv/whereami/))
* yamllint ([github.com/adrienverge/yamllint](https://github.com/adrienverge/yamllint/))

Find a complete list in [FORMULAE](https://github.com/rockyluke/homebrew-devops/blob/master/FORMULAE.md).

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
[codacy-img]: https://api.codacy.com/project/badge/Grade/1589449b5e2f4529be8d4d9514154f53
[codacy-url]: https://www.codacy.com/app/rockyluke/homebrew-devops
