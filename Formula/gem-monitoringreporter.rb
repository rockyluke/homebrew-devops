# -*- ruby -*-

require 'English'

class GemMonitoringreporter < Formula
  desc 'MonitoringReporter is a simple tool to request monitoring tool.'
  homepage 'https://github.com/vp-noc/monitoringreporter/'
  url 'https://rubygems.org/gems/monitoringreporter-1.0.0.gem'
  sha256 '38d272dbcb24a0976455d10c94c1793cc0594db40c5dc05ad74f55a7670a09f4'

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

    brew_gem_prefix = "#{prefix}/gems/monitoringreporter-#{version}"

    gemspec = Gem::Specification.load("#{prefix}/specifications/monitoringreporter-#{version}.gemspec")

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
    system "#{bin}/monitoringreporter", 'help'
  end
end
# EOF
