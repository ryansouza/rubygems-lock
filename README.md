# Rubygems::Lock

Use Gemfile and Gemfile.lock with CLI rubygem

CLI rubygems are applications too. Make sure your users have the experience you developed, with real dependency handling, free from version mismatches.


## Is this sane ???

I'm not entirely sure...


## Installation

- Move gemspec dependencies to the Gemfile

```
# in ____.gemspec, replace
....
spec.add_dependency "bundler", "~> 1.0"
spec.add_development_dependency "rake"
spec.add_development_dependency "minitest"
...

# with

spec.add_locked_dependencies


# add to Gemfile
...
gem "bundler", "~> 1.0"

group :development do
  gem "rake"
  gem "minitest"
  gem "rubygems-lock"    # Don't forget this! :)
end


# remove Gemfile.lock from .gitignore,
# check it in to version control
git add Gemfile.lock

# bundle like normal
bundle install

# commit everything and cut a gem
gem build ____.gemspec

# the gem has all the dependencies locked
# to the versions you developed and tested with
gem spec ____-#.#.#.gem --ruby
```
