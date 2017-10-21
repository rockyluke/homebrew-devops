# -*- ruby -*-

class GemBolt < Formula
  desc ' Execute commands remotely over SSH and WinRM'
  homepage 'https://github.com/puppetlabs/bolt/'
  url 'https://rubygems.org/gems/bolt-0.6.0.gem'
  sha256 'd03cd7149bca6a2bc55c2b26276a7e4deeedde1affed5305a758903db95a7586'

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

    raise 'gem install bolt failed with status #{$?.exitstatus}' unless $?.success?

    bin.rmtree if bin.exist?
    bin.mkpath

    brew_gem_prefix = "#{prefix}/gems/bolt-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/bolt-#{version}.gemspec")

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
    system "#{bin}/bolt", '--help'
  end
end
# EOF
