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

  resource "editdistance" do
    url "https://pypi.python.org/packages/a8/08/97ed5b60023ab4b67a46ee24bf1d3db93a9abc5b3be7e8f90de18160aaed/editdistance-0.3.1.tar.gz"
    sha256 "8ec8a2158b9234adb0ca7ecfb0b4caa35e45ad5d00353c80793c9f54e1a35121"
  end

  resource "isort" do
    url "https://github.com/timothycrosley/isort/archive/4.2.5.tar.gz"
    sha256 "d055e9697c3d12e2f9a67691853f19b39d694a6bc533ebcd21c5e609d67c597f"
  end

  resource "mccabe" do
    url "https://pypi.python.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"
    sha256 "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
  end

  def install
    virtualenv_install_with_resources
    # venv = virtualenv_create(libexec)
    # venv.pip_install resource("astroid")
    # venv.pip_install resource("isort")
    # venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/pylint --help"
  end
end
# EOF
