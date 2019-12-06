#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
msg = "Build v#{RailsFancies::VERSION}"
`gem build rails_fancies`
`git add .`
system "git commit -m '#{msg}'"
`git push origin master`
`gem push rails_fancies-#{RailsFancies::VERSION}.gem`
`git tag v#{RailsFancies::VERSION} -m msg`
`git push --tags`
