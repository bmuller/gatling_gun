require 'bundler/gem_tasks'
require 'rdoc/task'
require 'rake/testtask'

# need some tests!
# task :default => [:test]

desc "Create documentation"
Rake::RDocTask.new("doc") { |rdoc|
  rdoc.title = "gatling_gun - A Ruby library wrapping SendGrid's Newsletter API."
  rdoc.rdoc_dir = 'docs'
  rdoc.rdoc_files.include('README.markdown')
  rdoc.rdoc_files.include('lib/**/*.rb')
}
