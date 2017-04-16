# -*- ruby -*-

require 'language/go'

class MillipedeGo < Formula
  desc 'Print a beautiful millipede.'
  version '1.3.0'
  homepage 'https://github.com/getmillipede/millipede-go'
  url "https://github.com/getmillipede/millipede-go/archive/v#{version}.tar.gz"
  sha256 '49d1e6ee6843b82d6b72254d00813941590ad9d4850b27a60e2fc10cfdd9c4f4'

  depends_on 'go' => :build

  go_resource 'github.com/codegangsta/cli' do
    url 'https://github.com/codegangsta/cli.git'
  end

  def install
    ENV['GOPATH'] = buildpath
    mkdir_p buildpath/'src/github.com/getmillipede'
    ln_s buildpath, buildpath/'src/github.com/getmillipede/millipede-go'
    Language::Go.stage_deps resources, buildpath/'src'
    system 'go', 'build', '-o', "#{bin}/millipede-go", './cmd/millipede-go'
  end

  test do
    system "#{bin}/millipede-go --help"
  end
end
# EOF
