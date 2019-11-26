ENV['RACK_ENV'] ||= 'development'
require 'bundler'

APP_ROOT = File.expand_path('..', __dir__)
ENV['BUNDLE_GEMFILE'] ||= File.join(APP_ROOT, 'Gemfile')
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
CONFIG = File.join(APP_ROOT, 'config', 'database.yml')
             .then { |f| File.open(f) }
             .then { |f| File.read(f) }
             .then { |f| ERB.new(f).result }
             .then { |str| YAML.load(str)[ENV['RACK_ENV']] }

Dir[File.expand_path 'config/initializers/*.rb'].each { |f| require_relative f }
