# -*- ruby -*-

class PipPylint < Formula
  include Language::Python::Virtualenv

  desc "Python source code analyzer."
  version "1.7.0"
  homepage "https://github.com/pycqa/pylint/"
  url "https://github.com/pycqa/pylint/archive/pylint-#{version}.tar.gz"
  sha256 ""

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install_and_link buildpath
  end
end
# EOF
