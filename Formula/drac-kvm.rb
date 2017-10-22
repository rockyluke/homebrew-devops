# -*- ruby -*-

class DracKvm < Formula
  desc 'Simple CLI launcher for Dell DRAC KVM sessions.'
  homepage 'https://github.com/rockyluke/drac-kvm/'
  url 'https://github.com/rockyluke/drac-kvm/archive/v1.0.3.tar.gz'
  sha256 '4d5f6c56a07813d05b5ad94ecd2b14651884dbe03d3bd198f61b1e7e84855044'

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
