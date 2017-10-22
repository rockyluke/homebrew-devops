# -*- ruby -*-

require 'English'

class GemSup < Formula
  desc 'Sup is a console-based email client for people with a lot of email.'
  homepage 'https://github.com/sup-heliotrope/sup/'
  url 'https://rubygems.org/gems/sup-0.22.1.gem'
  sha256 'f1b1af9e6617a3ce076ffd7419c3d5c325ee46d9e299fc60fb86b8aa63d7429f'

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
           '--no-wrapper'

    raise "gem install failed with status #{$CHILD_STATUS.exitstatus}" unless $CHILD_STATUS.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}/gems/sup-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/sup-#{version}.gemspec")

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
end
# EOF
