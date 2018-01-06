# -*- ruby -*-

require 'English'

class GemRubocop < Formula
  desc 'Automatic Ruby code style checking tool.'
  homepage 'https://github.com/bbatsov/rubocop/'
  url 'https://rubygems.org/gems/rubocop-0.52.1.gem'
  sha256 '4ec659892e86c64ec25e7a543b4a717f9ee6e9450bdb9541e0d3492b43ce4234'

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
