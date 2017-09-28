# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator.'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/master.tar.gz'
  version 'master'
  sha256 '99e43b253985919f3d7e1d9880ce6a7168e5739b2febc61426a81229d0e5c32e'

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
