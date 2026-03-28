#!/usr/bin/env ruby
require_relative '../lib/rails_fancies/version'

begin
  require 'colorize'
rescue LoadError
end

def say(message, color = nil)
  if color && message.respond_to?(:colorize)
    puts message.colorize(color)
  else
    puts message
  end
end

def run(*command)
  system(*command) || abort("Command failed: #{command.join(' ')}")
end

def time_hash
  time = Time.now
  "#{time.day}-#{time.month}-#{time.year} #{time.hour}:#{time.min}"
end

msg = "Build v#{RailsFancies::VERSION}"
branch = `git branch --show-current`.strip
branch = 'master' if branch.empty?

puts msg
run('gem', 'build', 'rails_fancies.gemspec')
run('git', 'add', '.')
run('git', 'commit', '-m', msg)
say('Pushing to github - may need personal access token', :yellow)
say('create at github/settings/developer', :yellow)
run('git', 'push', 'origin', branch)
say('Push to rubygems, need to enter OTP from Google Authenticator', :yellow)
run('gem', 'push', "rails_fancies-#{RailsFancies::VERSION}.gem")
run('git', 'tag', "v#{RailsFancies::VERSION}", '-m', msg)
run('git', 'push', '--tags')
puts "pushed v#{RailsFancies::VERSION} tag"
git_sha = `git log --pretty=format:%h -n 1`.strip
puts "Bump version, remove old .ruby_version_xxx files, update changelog with #{git_sha} #{time_hash}"
