#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
msg = "Build v#{RailsFancies::VERSION}"
puts msg
`gem build rails_fancies`
`git add .`
system "git commit -m '#{msg}'"
`git push origin master`
puts 'Push to rubygems, need to enter OTP from Google Authenticator'
system "gem push rails_fancies-#{RailsFancies::VERSION}.gem"
`git tag v#{RailsFancies::VERSION} -m msg`
`git push --tags`
puts "pushed v#{RailsFancies::VERSION} tag"
git_sha = `git log --pretty=format:'%h' -n 1`
puts "Bump version, update changelog with #{git_sha} #{time_hash}"

BEGIN {
  def time_hash
  time = Time.now
  "#{time.day}-#{time.month}-#{time.year} #{time.hour}:#{time.min}"
  end
}

