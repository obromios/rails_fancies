Use the local `exception-fixing` and `rails-simplifier` skills if available.

You are working in a Ruby gem repository. The recurring task is to fix security issues reported by `bundle-audit` and complete the release workflow safely.

Required workflow:

1. Inspect the repo first.
   - Read `.ruby-version`, `Gemfile`, `Gemfile.lock`, the gemspec, `lib/<gem_name>/version.rb`, and any local `AGENTS.md`.
   - Check for a release helper script such as `script/push_gem.rb`.

2. Set up the local agent instructions for this repo.
   - If there is no local `AGENTS.md`, create one.
   - Add guidance that fixing `bundle-audit` findings is a frequent request.
   - Add a guardrail that before advising the user to run the release script, you must verify the latest published version on RubyGems or a reliable mirror.
   - If the local version is not greater than the published version, do not advise release. Tell the user to bump the version first.

3. Fix the security issues.
   - Run `bundle-audit check` first.
   - Apply the smallest safe dependency update that clears the advisory set.
   - Prefer targeted updates over broad refreshes.
   - Re-run `bundle-audit check` until it is clean.

4. Verify the project.
   - Run the full test suite, preferably `bundle exec rspec` unless the repo clearly uses another standard test command.
   - Report exact results.

5. If the user asks for release help:
   - Verify the latest published gem version before recommending the release script.
   - If the local version is newer, explain how to run the release script.
   - If the release script is unsafe or broken, fix it first.

6. If the user asks for git actions:
   - Create a clear commit message.
   - Commit only the intended changes.
   - Push only when explicitly asked.

Expected output back to the user:
- What security issues were found.
- What changed to fix them.
- Whether `bundle-audit` is now clean.
- Whether tests passed.
- Whether the local gem version is safe to release relative to the latest published version.
