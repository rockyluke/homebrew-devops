# -*- ruby -*-

class MillipedeCpp < Formula
  desc "Print a beautiful millipede."
  homepage "https://github.com/getmillipede/millipede-cpp/"
  url "https://github.com/getmillipede/millipede-cpp/archive/v1.0.0.tar.gz"
  sha256 "c19239228f3c22a8dd36cd70220d6884d42ae3f01bd14e4e359ff6badba257d8"

  depends_on "cmake" => [:build, "without-docs"]

  def install
    system "cmake", "CMakeLists.txt"
    system "make"
    bin.install "millipede-cpp"
  end

  test do
    system "#{bin}/millipede-cpp"
  end
end
# EOF
