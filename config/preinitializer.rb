# coding: UTF-8

begin
  require "rubygems"
  require "bundler"
rescue LoadError
  raise "Could not load the bundler gem. Install it with `gem install bundler`."
end

if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new("0.9.24")
  raise RuntimeError, "Your bundler version is too old." +
   "Run `gem install bundler` to upgrade."
end

begin
  # Set up load paths for all bundled gems
  ENV["BUNDLE_GEMFILE"] = File.expand_path("../../Gemfile", __FILE__)
  Bundler.setup
rescue Bundler::GemNotFound => e
  raise RuntimeError, "Bundler couldn't find some gems (#{e.message.split()[3]})\n" +
    "Did you run `bundle install`?"
end

#begin
  #require File.expand_path('../.bundle/environment', __FILE__)
#rescue LoadError
  #require 'rubygems'
  #require 'bundler'

  #Bundler.setup
#end

#Bundler.require
