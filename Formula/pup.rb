# -*- ruby -*-

require 'language/go'

class Pup < Formula
  desc 'Parsing HTML at the command line.'
  homepage 'https://github.com/ericchiang/pup/'
  url 'https://github.com/ericchiang/pup/archive/master.tar.gz'
  version 'master'
  sha256 '2db616f5236500d584dbe1085e9a4e24c998d26d837fbd25c9450ce040a09f1f'

  depends_on 'go' => :build

  # go_resource 'golang.org/x/tools/' do
  #   url 'https://go.googlesource.com/tools.git'
  # end

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/ericchiang/pup/').install Dir['*']
    Language::Go.stage_deps resources, buildpath/'src'
    system 'go', 'build', '-o', "#{bin}/pup", 'github.com/ericchiang/pup/'
  end

  test do
    system "#{bin}/pup", '--help'
  end
end
# EOF
