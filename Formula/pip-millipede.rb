# -*- ruby -*-

class PipMillipede < Formula
  include Language::Python::Virtualenv

  desc "Print a beautiful millipede."
  version "2.0"
  homepage "https://github.com/getmillipede/millipede-python/"
  url "https://github.com/getmillipede/millipede-python/releases/download/2.0/millipede-#{version}.tar.gz"
  sha256 ""

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install_and_link buildpath
  end
end
# EOF
