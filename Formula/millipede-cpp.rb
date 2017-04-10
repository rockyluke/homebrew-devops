# -*- ruby -*-

class MillipedeC < Formula
  desc "Print a beautiful millipede."
  homepage "https://github.com/getmillipede/millipede-c"
  url ""
  sha256 ""

  test do
    system "#{bin}/millipede-c --help"
  end
end
# EOF
