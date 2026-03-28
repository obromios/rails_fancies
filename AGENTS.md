# AGENTS

## Repo Workflow

- This is a Ruby gem repository. Inspect `.ruby-version`, `Gemfile`, `Gemfile.lock`, `rails_fancies.gemspec`, `lib/rails_fancies/version.rb`, and `script/push_gem.rb` before making release-related changes.
- Fixing `bundle-audit` findings is a frequent request. Prefer the smallest safe dependency update that clears the advisory set.
- Re-run `bundle-audit check` after dependency changes and do not consider the work complete until the audit is clean or the remaining risk is explicitly explained.
- After dependency changes, run the standard test suite with `mise exec ruby@3.4.8 -- bundle exec rspec` unless the repo clearly requires a different command.
- When proposing a commit message for a security dependency fix, use the form `Upgrade <gemname> to <version> for security`.

## Release Guardrails

- Before advising the user to run `script/push_gem.rb`, verify the latest published gem version on RubyGems or another reliable mirror.
- If the local gem version is not greater than the latest published version, do not advise release. Tell the user to bump the version first.
- Treat `script/push_gem.rb` as needing review before use; do not recommend it blindly.
