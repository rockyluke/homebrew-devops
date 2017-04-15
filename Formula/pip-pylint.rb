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
    url "https://pypi.python.org/packages/64/2b/b61398454f3f64c00c88d5858d857b385c1a4dd3445f36247ba8bc74678f/astroid-1.5.1.tar.gz"
    sha256 "b1d87cbb3dbcca64f8fb8252d2a6650c3bf7b1fc6516831c1b63462d965f2af7"
  end

  resource "editdistance" do
    url "https://pypi.python.org/packages/a8/08/97ed5b60023ab4b67a46ee24bf1d3db93a9abc5b3be7e8f90de18160aaed/editdistance-0.3.1.tar.gz"
    sha256 "8ec8a2158b9234adb0ca7ecfb0b4caa35e45ad5d00353c80793c9f54e1a35121"
  end

  resource "isort" do
    url "https://pypi.python.org/packages/70/65/49f66364f4ac551ec414e88537b02be439d1d9ea7e1fdd6d526fb8796bf9/isort-4.2.5.tar.gz"
    sha256 "56b20044f43cf6e6783fe95d054e754acca52dd43fbe9277c1bdff835537ea5c"
  end

  resource "lazy-object-proxy" do
    url "https://pypi.python.org/packages/65/63/b6061968b0f3c7c52887456dfccbd07bec2303296911757d8c1cc228afe6/lazy-object-proxy-1.2.2.tar.gz"
    sha256 "ddd4cf1c74279c349cb7b9c54a2efa5105854f57de5f2d35829ee93631564268"
  end

  resource "mccabe" do
    url "https://pypi.python.org/packages/06/18/fa675aa501e11d6d6ca0ae73a101b2f3571a565e0f7d38e062eec18a91ee/mccabe-0.6.1.tar.gz"
    sha256 "dd8d182285a0fe56bace7f45b5e7d1a6ebcbf524e8f3bd87eb0f125271b8831f"
  end

  resource "wrapt" do
    url "https://pypi.python.org/packages/a3/bb/525e9de0a220060394f4aa34fdf6200853581803d92714ae41fc3556e7d7/wrapt-1.10.10.tar.gz"
    sha256 "42160c91b77f1bc64a955890038e02f2f72986c01d462d53cb6cb039b995cdd9"
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
