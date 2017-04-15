# -*- ruby -*-

class PipPylint < Formula
  include Language::Python::Virtualenv

  desc "Python source code analyzer."
  version "1.7.0"
  homepage "https://github.com/pycqa/pylint/"
  url "https://github.com/pycqa/pylint/archive/pylint-#{version}.tar.gz"
  sha256 "a3e67cb0610bc9e648235c1790d030bbf973c54138f13c1f076e7f2be693dfe1"

  depends_on :python3

  resource "astroid" do
    url "https://github.com/timothycrosley/isort/archive/4.2.5.tar.gz"
    sha256 "d055e9697c3d12e2f9a67691853f19b39d694a6bc533ebcd21c5e609d67c597f"
  end

  resource "isort" do
    url "https://github.com/timothycrosley/isort/archive/4.2.5.tar.gz"
    sha256 "d055e9697c3d12e2f9a67691853f19b39d694a6bc533ebcd21c5e609d67c597f"
  end

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install resource("astroid")
    venv.pip_install resource("isort")
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/pylint --help"
  end
end
# EOF
