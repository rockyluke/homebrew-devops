# -*- ruby -*-

class PipGitlint < Formula
  include Language::Python::Virtualenv

  desc 'Linter for YAML files.'
  homepage 'https://github.com/jorisroovers/gitlint/'
  url 'https://pypi.python.org/packages/5b/5a/21a35893dc478dbadf89b2b03261ee5585494ba6e801a8f94c9664f78490/gitlint-0.8.2.tar.gz'
  sha256 'd632025d93cc95032e4b14f346c060e26f36365849e3cff5e8bac73e53b4296b'

  resource 'arrow' do
    url 'https://pypi.python.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150/arrow-0.10.0.tar.gz'
    sha256 '805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722'
  end

  resource 'click' do
    url 'https://pypi.python.org/packages/7a/00/c14926d8232b36b08218067bcd5853caefb4737cda3f0a47437151344792/click-6.6.tar.gz'
    sha256 'cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9'
  end

  resource 'ordereddict' do
    url 'https://pypi.python.org/packages/53/25/ef88e8e45db141faa9598fbf7ad0062df8f50f881a36ed6a0073e1572126/ordereddict-1.1.tar.gz'
    sha256 '1c35b4ac206cef2d24816c89f89cf289dd3d38cf7c449bb3fab7bf6d43f01b1f'
  end

  resource 'python-dateutil' do
    url 'https://pypi.python.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz'
    sha256 '891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca'
  end

  resource 'six' do
    url 'https://pypi.python.org/packages/16/d8/bc6316cf98419719bd59c91742194c111b6f2e85abac88e496adefaf7afe/six-1.11.0.tar.gz'
    sha256 '70e8a77beed4562e7f14fe23a786b54f6296e34344c23bc42f07b15018ff98e9'
  end

  resource 'sh' do
    url 'https://pypi.python.org/packages/39/ca/1db6ebefdde0a7b5fb639ebc0527d8aab1cdc6119a8e4ac7c1c0cc222ec5/sh-1.11.tar.gz'
    sha256 '590fb9b84abf8b1f560df92d73d87965f1e85c6b8330f8a5f6b336b36f0559a4'
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/gitlint", '--help'
  end
end
# EOF
