# -*- ruby -*-

class PipPydocstyle < Formula
  include Language::Python::Virtualenv

  desc 'Python docstring style checker.'
  homepage 'https://github.com/pycqa/pydocstyle/'
  url 'https://pypi.python.org/packages/b0/33/52e2fa5662fbb2a8bc9bdfe31327cd58c2f856b31851b73fc5baf86a2a14/pydocstyle-2.0.0.zip'
  sha256 '49680b7ea8c18e911135167e9f6986a3829031b55f2c737e6d2c398df38aafb5'

  resource 'six' do
    url 'https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz'
    sha256 '70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9'
  end

  resource 'snowballstemmer' do
    url 'https://pypi.python.org/packages/20/6b/d2a7cb176d4d664d94a6debf52cd8dbae1f7203c8e42426daa077051d59c/snowballstemmer-1.2.1.tar.gz'
    sha256 '919f26a68b2c17a7634da993d91339e288964f93c274f1343e3bbbe2096e1128'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/pydocstyle", '--help'
  end
end
# EOF
