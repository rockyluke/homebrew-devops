# -*- ruby -*-

class PipGitSweep < Formula
  include Language::Python::Virtualenv

  desc 'Clean up git branches.'
  homepage 'https://github.com/arc90/git-sweep/'
  url 'https://pypi.python.org/packages/68/71/a4b06ba2cd275a2cc1c1eef46ae655517c6b8b05326e8bf60b89e01f2a59/git-sweep-0.1.1.tar.gz'
  sha256 'cd29f1c37247b05aeef5f399489657f973aed78e2e2740da20a62502da0757b3'

  resource 'GitPython' do
    url 'https://github.com/gitpython-developers/GitPython/archive/1.0.0.tar.gz'
    sha256 'f4a709f7ff344cae296930d7182c7fbe6abe59c7847e1cd86f05742c92021fa9'
  end

  resource 'gitdb' do
    url 'https://pypi.python.org/packages/e3/95/7e5d7261feb46c0539ac5e451be340ddd64d78c5118f2d893b052c76fe8c/gitdb-0.6.4.tar.gz'
    sha256 'a3ebbc27be035a2e874ed904df516e35f4a29a778a764385de09de9e0f139658'
  end

  resource 'smmap' do
    url 'https://pypi.python.org/packages/bc/aa/b744b3761fff1b10579df996a2d2e87f124ae07b8336e37edc89cc502f86/smmap-0.9.0.tar.gz'
    sha256 '0e2b62b497bd5f0afebc002eda4d90df9d209c30ef257e8673c90a6b5c119d62'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/git-sweep", '--help'
  end
end
# EOF
