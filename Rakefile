require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :spec

desc 'Run Borrowing console'
task :console do
  require 'irb'
  require_relative 'lib/borrowing'
  ARGV.clear
  IRB.start
end
