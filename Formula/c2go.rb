# -*- ruby -*-

class C2go < Formula
  desc 'Tool for converting C to Go.'
  homepage 'https://github.com/elliotchance/c2go/'
  url 'https://github.com/elliotchance/c2go/archive/v0.16.5.tar.gz'
  sha256 'bec802208ce7dacdedb98deb0d2b94b317e9384f1e8ce334149caf7f8957860e'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/elliotchance/c2go/').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/c2go", 'github.com/elliotchance/c2go/'
  end

  test do
    system "#{bin}/c2go", '-v'
  end
end
# EOF
