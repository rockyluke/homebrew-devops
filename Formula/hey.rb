# -*- ruby -*-

require 'language/go'

class Hey < Formula
  desc 'HTTP load generator.'
  homepage 'https://github.com/rakyll/hey/'
  url 'https://github.com/rakyll/hey/archive/master.tar.gz'
  version 'master'
  sha256 '9be1ab28240d6151f9e65614ea5ceb6a681b28abd0cd605bc0b1b9b4f8a76e75'

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
