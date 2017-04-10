# -*- ruby -*-

class GemI2cssh < Formula
  desc "CsshX like cluster ssh using iTerm2 panes."
  version "2.2.0"
  homepage "https://github.com/wouterdebie/i2cssh/"
  url "https://rubygems.org/gems/i2cssh-#{version}.gem"
  sha256 "10885270b1ec08fae0ab7a0ee3f6f8043ab7ecd7d0a4bddfa26fb5c185cb6395"

  def install
    ENV['GEM_HOME']="#{prefix}"
    ENV['GEM_PATH']="#{prefix}"

    gem_path = "/usr/bin/gem"
    ruby_path = "/usr/bin/ruby"

    system "#{gem_path}",
           "install",
           "#{cached_download}",
           "--install-dir", "#{prefix}",
           "--bindir", "#{bin}",
           "--no-document",
           "--no-wrapper",
           "--no-user-install"

    raise "gem install 'i2cssh' failed with status #{$?.exitstatus}" unless $?.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}" + "/gems/i2cssh-#{version}"

    gemspec = Gem::Specification::load("#{prefix}/specifications/i2cssh-#{version}.gemspec")

    ruby_libs = Dir.glob("#{prefix}/gems/*/lib")
    gemspec.executables.each do |exe|
      file = Pathname.new("#{brew_gem_prefix}/#{gemspec.bindir}/#{exe}")
      (bin+file.basename).open('w') do |f|
        f << <<-RUBY
#!#{ruby_path}

ENV['GEM_HOME']="#{prefix}"
ENV['GEM_PATH']="#{prefix}"
$:.unshift(#{ruby_libs.map(&:inspect).join(",")})
load "#{file}"
# EOF
        RUBY
      end
    end
  end

  test do
    system "#{bin}/i2cssh --help"
  end
end
# EOF
