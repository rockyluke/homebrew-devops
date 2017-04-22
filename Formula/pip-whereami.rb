# -*- ruby -*-

class PipWhereami < Formula
  include Language::Python::Virtualenv

  desc "Uses WiFi to tell you where you are."
  homepage "https://github.com/kootenpv/whereami/"
  url "https://pypi.python.org/packages/d4/96/4da7c4f7655f399631e2b67d99fd9fff01b0998b5af9887ad4455d2384b4/whereami-0.3.63.tar.gz"
  sha256 "8ff8cbd876fc3817ba69a8caf16233401493e6f9ddd0f2e1bd9eb5838cb0fb5a"

  depends_on :python3

  resource "access_points" do
    url "https://pypi.python.org/packages/69/15/b71bbe5fe766ba322f7bbb7a1e417c6e80a61fddeb60543965e935aae31c/access_points-0.3.52.tar.gz"
    sha256 "e5e872b276d3642a5f0f9214aee4f53839ec9ff5d06f56da74a1a372305fba6e"
  end

  resource "numpy" do
    url "https://pypi.python.org/packages/a5/16/8a678404411842fe02d780b5f0a676ff4d79cd58f0f22acddab1b392e230/numpy-1.12.1.zip"
    sha256 "a65266a4ad6ec8936a1bc85ce51f8600634a31a258b722c9274a80ff189d9542"
  end

  resource "scikit-learn" do
    url "https://pypi.python.org/packages/f1/dc/5fb2834511eef6f86e17b6ec41c0c7a60733f79633827e75aaa55029a9fa/scikit-learn-0.18.1.tar.gz"
    sha256 "1eddfc27bb37597a5d514de1299981758e660e0af56981c0bfdf462c9568a60c"
  end

  resource "scipy" do
    url "https://pypi.python.org/packages/e5/93/9a8290e7eb5d4f7cb53b9a7ad7b92b9827ecceaddfd04c2a83f195d8767d/scipy-0.19.0.zip"
    sha256 "4190d34bf9a09626cd42100bbb12e3d96b2daf1a8a3244e991263eb693732122"
  end

  resource "tqdm" do
    url "https://pypi.python.org/packages/46/b0/615b394ac0b25f1f1ef229e223c335558d69db97301c93e932fb7e5e4679/tqdm-4.11.2.tar.gz"
    sha256 "14baa7a9ea7723d46f60de5f8c6f20e840baa7e3e193bf0d9ec5fe9103a15254"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/whereami", "--help"
  end
end
# EOF
