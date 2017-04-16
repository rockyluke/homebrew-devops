# -*- ruby -*-

class PipMillipede < Formula
  include Language::Python::Virtualenv

  desc 'A python library for generating nginx configs.'
  version '0.0.2'
  homepage 'https://github.com/linkedin/nginx-config-builder/'
  url "https://pypi.python.org/packages/c1/cd/ba00e0e8b9f3528db19ea12e6d7706be56ca8112b9e69b6b19d4e72f75ae/nginx-config-builder-#{version}.tar.gz"
  sha256 '009466d0a919af3dc4afadb6a70efb5610dab96d7134f18ac9f3a37c4279079d'

  def install
    venv = virtualenv_create(libexec)
    venv.pip_install_and_link buildpath
  end
end
# EOF
