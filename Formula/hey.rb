# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator.'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/v0.1.0.tar.gz'
  sha256 'a8127634e21897c587c6c375f88121e907ce4af8bf71374db44c5d752ae4a296'

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
