# -*- ruby -*-

class PipGitlint < Formula
  include Language::Python::Virtualenv

  desc 'Linter for YAML files.'
  homepage 'https://github.com/jorisroovers/gitlint/'
  url 'https://pypi.python.org/packages/5b/5a/21a35893dc478dbadf89b2b03261ee5585494ba6e801a8f94c9664f78490/gitlint-0.8.2.tar.gz'
  sha256 'd632025d93cc95032e4b14f346c060e26f36365849e3cff5e8bac73e53b4296b'

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/gitlint", '--help'
  end
end
# EOF
