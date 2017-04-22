# -*- ruby -*-

class PipYamllint < Formula
  include Language::Python::Virtualenv

  desc 'Linter for YAML files.'
  homepage 'https://github.com/adrienverge/yamllint/'
  url 'https://pypi.python.org/packages/54/2a/6cffdc51b0c18818d4cee09dfb9048914e21a0a460e3494cad8e25d1955e/yamllint-1.6.1.tar.gz'
  sha256 '6d6cc4d6545aa40a0edc9039d63ce0828cd50d273c775e7df2092c9b28c15ed4'

  resource 'pyyaml' do
    url 'https://pypi.python.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz'
    sha256 '592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/yamllint", '--help'
  end
end
# EOF
