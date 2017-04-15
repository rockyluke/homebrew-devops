# -*- ruby -*-

class PipPylint < Formula
  include Language::Python::Virtualenv

  desc "Python source code analyzer."
  version "1.7.0"
  homepage "https://github.com/pycqa/pylint/"
  url "https://github.com/pycqa/pylint/archive/pylint-#{version}.tar.gz"
  sha256 "a3e67cb0610bc9e648235c1790d030bbf973c54138f13c1f076e7f2be693dfe1"

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/pylint --help"
  end
end
# EOF
