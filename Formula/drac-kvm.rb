# -*- ruby -*-

class DracKvm < Formula
  desc 'Simple CLI launcher for Dell DRAC KVM sessions.'
  homepage 'https://github.com/rockyluke/drac-kvm/'
  url 'https://github.com/rockyluke/drac-kvm/archive/v1.1.0.tar.gz'
  sha256 'f9c392ad631efcc507864b9742e237b9c3cc3cdcf90fae363b2a36d60bcddb65'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/rockyluke/drac-kvm').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/drac-kvm", 'github.com/rockyluke/drac-kvm'
  end

  test do
    system "#{bin}/drac-kvm"
  end
end
# EOF
