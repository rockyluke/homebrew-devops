# -*- ruby -*-

class Gocyclo < Formula
  desc 'Calculate cyclomatic complexities of functions in Go source code.'
  homepage 'https://github.com/fzipp/gocyclo/'
  url 'https://github.com/fzipp/gocyclo/archive/master.tar.gz'
  version 'master'
  sha256 'de1b7210336a62e1c1128ce8d15c224955d24664285ff668ec9aeafb776f5da1'

  depends_on 'go' => :build

  def install
    ENV['GOPATH']      = buildpath
    ENV['GOBIN']       = buildpath
    ENV['CGO_ENABLED'] = '0'

    (buildpath/'src/github.com/fzipp/gocyclo/').install Dir['*']
    system 'go', 'build', '-o', '#{bin}/gocyclo', 'github.com/fzipp/gocyclo/'
  end

  test do
    system '#{bin}/gocyclo'
  end
end
# EOF
