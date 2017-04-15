# -*- ruby -*-

class PipWhereami < Formula
  include Language::Python::Virtualenv

  desc "Uses WiFi to tell you where you are."
  version "0.3.63"
  homepage "https://github.com/kootenpv/whereami/"
  url "https://pypi.python.org/packages/d4/96/4da7c4f7655f399631e2b67d99fd9fff01b0998b5af9887ad4455d2384b4/whereami-#{version}.tar.gz"
  sha256 "8ff8cbd876fc3817ba69a8caf16233401493e6f9ddd0f2e1bd9eb5838cb0fb5a"

  depends_on :python3

  resource "access_points" do
    url "https://pypi.python.org/packages/69/15/b71bbe5fe766ba322f7bbb7a1e417c6e80a61fddeb60543965e935aae31c/access_points-0.3.52.tar.gz"
    sha256 ""
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/whereami --help"
  end
end
# EOF
