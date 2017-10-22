# -*- ruby -*-

require 'English'

class GemRubocop < Formula
  desc 'Automatic Ruby code style checking tool.'
  homepage 'https://github.com/bbatsov/rubocop/'
  url 'https://rubygems.org/gems/rubocop-0.51.0.gem'
  sha256 'c131a5c063600cd31cf49c69130c16b94a6bd7d6a35f6f00c587ac6330bdc233'

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

    brew_gem_prefix = "#{prefix}/gems/rubocop-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/rubocop-#{version}.gemspec")

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
    system "#{bin}/rubocop", '--help'
  end
end
# EOF
