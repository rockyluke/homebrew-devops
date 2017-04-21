# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator, ApacheBench (ab) replacement.'
  version 'master'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/master.tar.gz'
  sha256 ''

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'


    (buildpath/'src/github.com/rakyll/hey/').install Dir['*']
    system 'go', 'build', '-o', "#{bin}/hey", 'github.com/rakyll/hey/'
  end

  test do
    system "#{bin}/hey"
  end
end
# EOF
