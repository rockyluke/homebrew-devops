# -*- ruby -*-

class PipYamllint < Formula
  include Language::Python::Virtualenv

  desc "A linter for YAML files."
  version "1.6.1"
  homepage "https://github.com/adrienverge/yamllint/"
  url "https://pypi.python.org/packages/54/2a/6cffdc51b0c18818d4cee09dfb9048914e21a0a460e3494cad8e25d1955e/yamllint-1.6.1.tar.gz"
  sha256 ""

  depends_on :python3

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/yamllint --help"
  end
end
# EOF
