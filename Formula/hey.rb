# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator.'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/master.tar.gz'
  version 'master'
  sha256 '486fd76e052e26e23587445628be5b79889d0e456af149bfec250702ad652ef4'

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
