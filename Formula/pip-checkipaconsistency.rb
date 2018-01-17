# -*- ruby -*-

class PipCheckipaconsistency < Formula
  include Language::Python::Virtualenv

  desc 'Tool to check consistency across FreeIPA servers.'
  homepage 'https://github.com/peterpakos/checkipaconsistency/'
  url 'https://pypi.python.org/packages/6f/59/6c281c080c6893bd5e7297d414334e154385516cc97dc140f3ec35367fe0/checkipaconsistency-2.7.1.tar.gz'
  sha256 'e71439803d16612d77924b006a44b032cc3bd26213dfd2382196067a7e4fd977'

  resource 'dnspython' do
    url 'https://pypi.python.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip'
    sha256 '40f563e1f7a7b80dc5a4e76ad75c23da53d62f1e15e6e517293b04e1f84ead7c'
  end

  resource 'prettytable' do
    url 'https://pypi.python.org/packages/e0/a1/36203205f77ccf98f3c6cf17cf068c972e6458d7e58509ca66da949ca347/prettytable-0.7.2.tar.gz'
    sha256 '2d5460dc9db74a32bcc8f9f67de68b2c4f4d2f01fa3bd518764c69156d9cacd9'
  end

  resource 'pyldap' do
    url 'https://pypi.python.org/packages/68/94/291eb5e4dbf804dd57125c8309aee5678caf470acbe077151d711e185034/pyldap-2.4.45.tar.gz'
    sha256 '064ec1ec7db9ff3b941d83f94bacbe896be944951db548d774ad9cafdafd7887'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/cipa", '--help'
  end
end
# EOF
