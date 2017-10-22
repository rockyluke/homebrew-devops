# -*- ruby -*-

require 'English'

class GemYamlLint < Formula
  desc 'A linter for YAML files.'
  homepage 'https://github.com/pryz/yaml-lint/'
  url 'https://rubygems.org/gems/yaml-lint-0.0.9.gem'
  sha256 'a5f96c17b3ef27d2302a9e456a6b51a59e738e12582f7a4117584c99161c394c'

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

    brew_gem_prefix = "#{prefix}/gems/yaml-lint-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/yaml-lint-#{version}.gemspec")

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
    system "#{bin}/yaml-lint", '--help'
  end
end
# EOF
