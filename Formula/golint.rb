# -*- ruby -*-

require 'language/go'

class Golint < Formula
  desc 'This is a linter for Go source code.'
  version 'master'
  homepage 'https://github.com/golang/lint/'
  url 'https://github.com/golang/lint/archive/master.tar.gz'
  sha256 ''

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/golang/lint/').install Dir['*']

    system 'go', 'build', '-o', "#{bin}/golint", '-v', 'github.com/golang/lint/golint/'
  end

  test do
    system "#{bin}/golint --help"
  end
end
# EOF
