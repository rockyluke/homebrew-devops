# -*- ruby -*-

class GemApireaper < Formula
  desc 'APIReaper is a simple tool to assess an API and its answer.'
  homepage 'https://github.com/vp-noc/apireaper/'
  url 'https://rubygems.org/gems/apireaper-1.0.9.gem'
  sha256 '0f2fb7c3a395edd5d236a612ef98b4675e7e3b6e2d6225efa12965c00b2b89a3'

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
