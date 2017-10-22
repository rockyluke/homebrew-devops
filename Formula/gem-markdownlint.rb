# -*- ruby -*-

require 'English'

class GemMarkdownlint < Formula
  desc 'Linter for Markdown files.'
  homepage 'https://github.com/mivok/markdownlint/'
  url 'https://rubygems.org/gems/mdl-0.4.0.gem'
  sha256 'e2de244a72ac4e90bd9045582fe7cfed84b436342a127dd6a5fb9c2b016fa637'

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

    brew_gem_prefix = "#{prefix}/gems/mdl-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/mdl-#{version}.gemspec")

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
    system "#{bin}/mdl", '--help'
  end
end
# EOF
