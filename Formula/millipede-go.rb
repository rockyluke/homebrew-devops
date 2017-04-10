# -*- ruby -*-

require "language/go"

class MillipedeGo < Formula
  desc "Print a beautiful millipede."
  homepage "https://github.com/getmillipede/millipede-go"
  url "https://github.com/getmillipede/millipede-go/archive/v1.3.0.tar.gz"
  sha256 "643b23c486ec887bdf2d071692a4e5baecb65d5b6a70fb5c135bedaf653180ca"

  depends_on "go" => :build

  go_resource "github.com/codegangsta/cli" do
    url "https://github.com/codegangsta/cli.git"
  end

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/getmillipede"
    ln_s buildpath, buildpath/"src/github.com/getmillipede/millipede-go"
    Language::Go.stage_deps resources, buildpath/"src"
    system "go", "build", "-o", "#{bin}/millipede-go", "./cmd/millipede-go"
  end

  test do
    system "#{bin}/millipede-go --help"
  end
end
# EOF
