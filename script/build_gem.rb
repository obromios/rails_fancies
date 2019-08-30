#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
# `gem build rails_fancies`
# `git add .`
# `git commit -m "Build v#{RailsFancies::VERSION} of rails_fancies"`
`bundle`
`git push origin master`
`gem push rails_fancies-#{RailsFancies::VERSION}.gem`
`git tag v#{RailsFancies::VERSION}`
`git push origin --tags`
