# -*- ruby -*-

require "language/go"

class DracKvm < Formula
  desc 'A simple CLI launcher for Dell DRAC KVM sessions.'
  version '1.0.2'
  homepage 'https://github.com/rockyluke/drac-kvm/'
  url "https://github.com/rockyluke/drac-kvm/archive/v#{version}.tar.gz"
  sha256 'ad0e42be3673de8a5ff537659894a66ab5662fefce84d25fc10c182507fe6278'

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    ENV['GOBIN'] = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/rockyluke/drac-kvm').install Dir['*']

    system 'go', 'build', '-o', "#{bin}/drac-kvm", '-v', 'github.com/rockyluke/drac-kvm'
  end

  test do
    system "#{bin}/drac-kvm --help"
  end
end
# EOF
