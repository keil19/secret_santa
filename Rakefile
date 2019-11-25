require_relative 'config/boot'
require 'rom/sql/rake_task'

namespace :db do
  task :setup do
    ROM::SQL::RakeSupport.env = MAIN_CONTAINER
  end
end
#
# task :console do
#   sh './console'
#   exit(0)
# end
