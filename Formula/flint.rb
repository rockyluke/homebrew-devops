# -*- ruby -*-

require 'language/go'

class Flint < Formula
  desc 'Check your project for common sources of contributor friction.'
  homepage 'https://github.com/pengwynn/flint/'
  url 'https://github.com/pengwynn/flint/archive/master.tar.gz'
  version 'master'
  sha256 'aa97adb8455531db127759a6c35a8fb1556d9cbea086c44d8c2bbed8de6727d3'

  depends_on 'go' => :build

  go_resource 'github.com/codegangsta/cli' do
    url 'https://github.com/codegangsta/cli.git'
  end

  go_resource 'github.com/fatih/color' do
    url 'https://github.com/fatih/color.git'
  end

  go_resource 'github.com/fhs/go-netrc' do
    url 'https://github.com/fhs/go-netrc.git'
  end

  go_resource 'github.com/jingweno/go-sawyer' do
    url 'https://github.com/jingweno/go-sawyer.git'
  end

  go_resource 'github.com/jtacoma/uritemplates' do
    url 'https://github.com/jtacoma/uritemplates.git'
  end

  go_resource 'github.com/octokit/go-octokit' do
    url 'https://github.com/octokit/go-octokit.git'
  end

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/pengwynn/flint/').install Dir['*']
    Language::Go.stage_deps resources, buildpath/'src'
    system 'go', 'build', '-o', "#{bin}/flint", 'github.com/pengwynn/flint/'
  end

  test do
    system "#{bin}/flint", '--help'
  end
end
# EOF
