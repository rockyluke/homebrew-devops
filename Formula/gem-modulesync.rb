# -*- ruby -*-

require 'English'

class GemModulesync < Formula
  desc 'Synchronize common files between GitHub module repositories.'
  homepage 'https://github.com/voxpupuli/modulesync/'
  url 'https://rubygems.org/gems/modulesync-0.8.1.gem'
  sha256 'ae6ac387bd6ee72adcfc8b2dca68b636283c2c66e992363ea72b0ebcf1e31887'

  def install
    ENV['GEM_HOME'] = prefix
    ENV['GEM_PATH'] = prefix

    gem_path  = '/usr/bin/gem'
    ruby_path = '/usr/bin/ruby'

    system gem_path,
           'install',
           cached_download,
           '--install-dir', prefix,
           '--bindir', bin,
           '--no-document',
           '--no-wrapper',
           '--no-user-install'

    raise "gem install failed with status #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}/gems/modulesync-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/modulesync-#{version}.gemspec")

    ruby_libs = Dir.glob("#{prefix}/gems/*/lib")
    gemspec.executables.each do |exe|
      file = Pathname.new("#{brew_gem_prefix}/#{gemspec.bindir}/#{exe}")
      (bin + file.basename).open('w') do |f|
        f << <<-RUBY
#!#{ruby_path}

ENV['GEM_HOME'] = "#{prefix}"
ENV['GEM_PATH'] = "#{prefix}"
$:.unshift(#{ruby_libs.map(&:inspect).join(',')})
load "#{file}"
# EOF
        RUBY
      end
    end
  end

  test do
    system "#{bin}/msync", '--help'
  end
end
# EOF
