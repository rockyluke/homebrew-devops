# -*- ruby -*-

class PipMillipede < Formula
  include Language::Python::Virtualenv

  desc 'Print a beautiful millipede.'
  homepage 'https://github.com/getmillipede/millipede-python/'
  url 'https://github.com/getmillipede/millipede-python/releases/download/2.0/millipede-2.0.tar.gz'
  sha256 '009466d0a919af3dc4afadb6a70efb5610dab96d7134f18ac9f3a37c4279079d'

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/millipede", '--help'
  end
end
# EOF
