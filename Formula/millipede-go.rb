# -*- ruby -*-

class MillipedeGo < Formula
  desc 'Print a beautiful millipede.'
  homepage 'https://github.com/getmillipede/millipede-go/'
  url 'https://github.com/getmillipede/millipede-go/archive/v1.3.0.tar.gz'
  sha256 'b21628edf3fb3ef32a29b5e458ec7c13aa1dcd6d661964edfe14f064ab722af3'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/getmillipede/millipede-go').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/millipede-go", 'github.com/getmillipede/millipede-go/cmd/millipede-go/'
  end

  test do
    system "#{bin}/millipede-go", '--help'
  end
end
# EOF
