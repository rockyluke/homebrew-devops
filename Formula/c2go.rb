# -*- ruby -*-

require 'language/go'

class C2go < Formula
  desc 'A tool for converting C to Go.'
  version '0.8.6'
  homepage 'https://github.com/golang/lint/'
  url "https://github.com/elliotchance/c2go/archive/v#{version}.tar.gz"
  sha256 '2d6b7c648723c31a4a8839d70cf3d7053f265071dbf73d99707c3bb5bb401e80'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/elliotchance/c2go/').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/c2go", 'github.com/elliotchance/c2go/'
  end
end
# EOF
