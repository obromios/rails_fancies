#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
msg = "Build v#{RailsFancies::VERSION} of rails_fancies"
`gem build rails_fancies`
`git add .`
`git commit -m v1.13`
`git push origin master`
`gem push rails_fancies-#{RailsFancies::VERSION}.gem`
`git tag v#{RailsFancies::VERSION} -m msg`
`git push --tags`
