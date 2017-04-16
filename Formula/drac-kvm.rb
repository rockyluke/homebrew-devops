# -*- ruby -*-

require "language/go"

class DracKvm < Formula
  desc "A simple CLI launcher for Dell DRAC KVM sessions."
  homepage "https://github.com/paulmaddox/drac-kvm/"
  url "https://github.com/PaulMaddox/drac-kvm/archive/master.zip"
  sha256 ""

  depends_on "go" => :build

  def install
    ENV['GOPATH'] = buildpath
    ENV['GOBIN'] = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/paulmaddox/drac-kvm').install Dir['*']

    system 'go', 'build', '-o', "#{bin}/drac-kvm", '-v', 'github.com/paulmaddox/drac-kvm'
  end

  test do
    system "#{bin}/drac-kvm --help"
  end
end
# EOF
