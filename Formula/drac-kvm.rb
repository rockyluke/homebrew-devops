# -*- ruby -*-

require "language/go"

class DracKvm < Formula
  desc 'A simple CLI launcher for Dell DRAC KVM sessions.'
  version '1.0.0'
  homepage 'https://github.com/rockyluke/drac-kvm/'
  url "https://github.com/rockyluke/drac-kvm/archive/v#{version}.tar.gz"
  sha256 '5e07d12fe634ceb2852076a36aaa84bfb93a698af3f5c0e4334227a2594dfd6a'

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
