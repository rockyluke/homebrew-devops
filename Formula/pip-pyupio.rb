# -*- ruby -*-

class PipPyupio < Formula
  include Language::Python::Virtualenv

  desc 'Tool to update all your projects requirement.'
  homepage 'https://github.com/pyupio/pyup/'
  url 'https://pypi.python.org/packages/42/6a/e1996d9a0d18c6862d1092e5f166a11ac58ca902c79de6ad3748169dbe66/pyupio-0.6.0.tar.gz'
  sha256 '699e23b9b14b67b5bf07751deb9d53ff6f704ebecc0ed5352b64b64ec4d27e23'

  depends_on :python3

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/pyupio", '--help'
  end
end
# EOF
