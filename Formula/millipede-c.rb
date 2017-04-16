# -*- ruby -*-

class MillipedeC < Formula
  desc 'Print a beautiful millipede.'
  version '1.0.0'
  homepage 'https://github.com/getmillipede/millipede-c/'
  url "https://github.com/getmillipede/millipede-c/archive/v#{version}.tar.gz"
  sha256 '87405158d9d52d6fc8d089cc17f4dbb53b2a463e1781b854674c7b2f84ae504b'

  def install
    system 'make'
    bin.install 'millipede-c'
  end
end
# EOF
