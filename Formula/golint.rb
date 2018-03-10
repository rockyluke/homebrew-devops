# -*- ruby -*-

require 'language/go'

class Golint < Formula
  desc 'Linter for Go files.'
  homepage 'https://github.com/golang/lint/'
  url 'https://github.com/golang/lint/archive/master.tar.gz'
  version 'master'
  sha256 '33829c5a6384d0190702247638abd4997e5f1c8cbe1f52d8ed87cf18dcd6e412'

  depends_on 'go' => :build

  go_resource 'golang.org/x/tools/' do
    url 'https://go.googlesource.com/tools.git'
  end

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/golang/lint/').install Dir['*']
    Language::Go.stage_deps resources, buildpath/'src'
    system 'go', 'build', '-o', "#{bin}/golint", 'github.com/golang/lint/golint/'
  end

  test do
    system "#{bin}/golint"
  end
end
# EOF
