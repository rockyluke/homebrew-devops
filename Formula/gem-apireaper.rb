# -*- ruby -*-

class GemApireaper < Formula
  desc 'APIReaper is a simple tool to assess an API and its answer.'
  homepage 'https://github.com/vp-noc/apireaper/'
  url 'https://rubygems.org/gems/apireaper-1.0.10.gem'
  sha256 '73faa756eb046d6486f40195f691634c84e1a8c9a6b8d26a6aca53fd28fe48c9'

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

    raise 'gem install apireaper failed with status #{$?.exitstatus}' unless $?.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}/gems/apireaper-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/apireaper-#{version}.gemspec")

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
    system "#{bin}/apireaper", 'help'
  end
end
# EOF
