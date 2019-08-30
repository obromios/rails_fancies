#!/usr/bin/env ruby
require '/Users/Chris/Sites/rails_fancies/lib/rails_fancies/version.rb'
include RailsFancies
`bundle`
`git add .`
`git commit -m "Build v#{RailsFancies::VERSION} of rails_fancies"`
`git tag v#{RailsFancies::VERSION}`
`git push origin v#{RailsFancies::VERSION}`
`git push origin master`

