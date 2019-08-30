#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
msg = "Build v#{RailsFancies::VERSION} of rails_fancies"
`bundle`
`git add .`
`git commit -m nsg`
`git tag v#{RailsFancies::VERSION} -m msg`
`git push origin v#{RailsFancies::VERSION}`
`git push origin master`

