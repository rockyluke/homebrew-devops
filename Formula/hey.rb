# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator, ApacheBench (ab) replacement.'
  version 'master'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/master.tar.gz'
  sha256 '33d90b68790bf6864494ded966d5abc8c059031eeea098bc7ad6fba6ce54783d'

  depends_on 'go' => :build

  go_resource 'golang.org/x/text/' do
    url 'https://go.googlesource.com/text.git'
  end

  go_resource 'golang.org/x/net/' do
    url 'https://go.googlesource.com/net.git'
  end

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'


    (buildpath/'src/github.com/rakyll/hey/').install Dir['*']
    Language::Go.stage_deps resources, buildpath/'src'
    system 'go', 'build', '-o', "#{bin}/hey", 'github.com/rakyll/hey/'
  end

  test do
    system "#{bin}/hey"
  end
end
# EOF
