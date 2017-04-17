# -*- ruby -*-

require 'language/go'

class Gocyclo < Formula
  desc 'Calculate cyclomatic complexities of functions in Go source code.'
  version 'master'
  homepage 'https://github.com/fzipp/gocyclo/'
  url 'https://github.com/fzipp/gocyclo/archive/master.tar.gz'
  sha256 :false

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'


    (buildpath/'src/github.com/fzipp/gocyclo/').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/gocyclo", 'github.com/fzipp/gocyclo/'
  end

  test do
    system "#{bin}/gocyclo"
  end
end
# EOF
