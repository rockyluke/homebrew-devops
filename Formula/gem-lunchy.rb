# -*- ruby -*-

class GemLunchy < Formula
  desc "Friendly wrapper around launchct."
  version "0.10.4"
  homepage "https://github.com/eddiezane/lunchy/"
  url "https://rubygems.org/gems/lunchy-#{version}.gem"
  sha256 ""

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

    raise "gem install 'lunchy' failed with status #{$?.exitstatus}" unless $?.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}" + "/gems/lunchy-#{version}"

    gemspec = Gem::Specification::load("#{prefix}/specifications/lunchy-#{version}.gemspec")

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
end
# EOF
