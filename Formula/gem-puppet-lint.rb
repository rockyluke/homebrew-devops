# -*- ruby -*-

require 'English'

class GemPuppetLint < Formula
  desc 'Linter for Puppet files.'
  homepage 'https://github.com/rodjek/puppet-lint/'
  url 'https://rubygems.org/gems/puppet-lint-2.3.3.gem'
  sha256 '8d3f294b1220253580ec7b19ff8a88e2065566d3da47adbefd88a7e178796e23'

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

    brew_gem_prefix = "#{prefix}/gems/puppet-lint-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/puppet-lint-#{version}.gemspec")

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
    system "#{bin}/puppet-lint", '--help'
  end
end
# EOF
