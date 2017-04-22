# -*- ruby -*-

class PipPycodestyle < Formula
  include Language::Python::Virtualenv

  desc 'Python style checker.'
  homepage 'https://github.com/pycqa/pycodestyle/'
  url 'https://pypi.python.org/packages/e1/88/0e2cbf412bd849ea6f1af1f97882add46a374f4ba1d2aea39353609150ad/pycodestyle-2.3.1.tar.gz'
  sha256 '682256a5b318149ca0d2a9185d365d8864a768a28db66a84a2ea946bcc426766'

  depends_on :python3

  def install
    virtualenv_install_with_resources
  end

  test do
    system '#{bin}/pycodestyle', '--help'
  end
end
# EOF
