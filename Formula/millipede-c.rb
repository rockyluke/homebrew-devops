# -*- ruby -*-

class MillipedeC < Formula
  desc "Print a beautiful millipede."
  version "1.1"
  homepage "https://github.com/getmillipede/millipede-c/"
  url "https://github.com/getmillipede/millipede-c/archive/#{version}.tar.gz"
  sha256 ""

  def install
    system "make"
    bin.install "millipede-c"
  end
end
# EOF
