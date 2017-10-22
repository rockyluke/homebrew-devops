# -*- ruby -*-

class Pup < Formula
  desc 'Parsing HTML at the command line.'
  homepage 'https://github.com/ericchiang/pup/'
  url 'https://github.com/ericchiang/pup/archive/v0.4.0.tar.gz'
  sha256 '0d546ab78588e07e1601007772d83795495aa329b19bd1c3cde589ddb1c538b0'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/ericchiang/pup/').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/pup", 'github.com/ericchiang/pup/'
  end

  test do
    system "#{bin}/pup", '--help'
  end
end
# EOF
