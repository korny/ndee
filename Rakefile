require "bundler/gem_tasks"

desc 'Run a simple test'
task :test do
  require 'ndee'
  
  def Ndee.sites_available
    './examples'
  end
  
  puts Ndee.document_roots_by_domain['rubychan.de'] == '/var/www/rubychan.de/current/public' ? '.' : 'F'
end

task :default => :test
