cd spec/dummy
export BUNDLE_GEMFILE=$PWD/Gemfile

bundle exec cucumber
bundle exec rspec
