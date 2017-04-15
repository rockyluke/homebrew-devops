# -*- ruby -*-

class PipMillipede < Formula
  include Language::Python::Virtualenv

  desc "Print a beautiful millipede."
  version "2.0"
  homepage "https://github.com/getmillipede/millipede-python/"
  url "https://github.com/getmillipede/millipede-python/releases/download/2.0/millipede-#{version}.tar.gz"
  sha256 "009466d0a919af3dc4afadb6a70efb5610dab96d7134f18ac9f3a37c4279079d"

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install_and_link buildpath
  end

  test do
    system "#{bin}/millipede --help"
  end
end
# EOF
