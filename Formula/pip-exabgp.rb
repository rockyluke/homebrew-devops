# -*- ruby -*-

class PipExabgp < Formula
  include Language::Python::Virtualenv

  desc 'The BGP swiss army knife of networking.'
  homepage 'https://github.com/exa-networks/exabgp/'
  url 'https://pypi.python.org/packages/fa/45/53043724453dbebc1464e62cfdf4aca849fbeffe14d009f418d43c917328/exabgp-3.4.18.tar.gz'
  sha256 'cb6c17e572d66c60893b204075af3f26e982fa843be13f4a198df0ee5ff56de2'

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/exabgp", '--help'
  end
end
# EOF
