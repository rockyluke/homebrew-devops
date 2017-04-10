# -*- ruby -*-

class MillipedeCpp < Formula
  desc "Print a beautiful millipede."
  version "1.0.0"
  homepage "https://github.com/getmillipede/millipede-cpp/"
  url "https://github.com/getmillipede/millipede-cpp/archive/v#{version}.tar.gz"
  sha256 ""

  depends_on "cmake" => [:build, "without-docs"]
  depends_on "sphinx-doc" => :optional

  def install
    system "cmake", "CMakeLists.txt"
    system "make"
    bin.install "millipede-cpp"
  end
end
# EOF
