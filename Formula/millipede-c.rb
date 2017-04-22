# -*- ruby -*-

class MillipedeC < Formula
  desc 'Print a beautiful millipede.'
  homepage 'https://github.com/getmillipede/millipede-c/'
  url 'https://github.com/getmillipede/millipede-c/archive/v1.0.0.tar.gz'
  sha256 '87405158d9d52d6fc8d089cc17f4dbb53b2a463e1781b854674c7b2f84ae504b'

  def install
    system 'make'
    bin.install 'millipede-c'
  end

  test do
    system "#{bin}/millipede-c"
  end
end
# EOF
