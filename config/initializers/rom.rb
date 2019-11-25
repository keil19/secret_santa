require_relative '../../lib/relations/users'
require_relative '../../lib/commands/user/create'
config = ROM::Configuration.new(:sql, "postgres://#{CONFIG[:host]}/#{CONFIG[:name]}", CONFIG)
config.register_relation(Users)
config.register_command(User::Create)
CONFIGURATION = config
MAIN_CONTAINER = ROM.container(CONFIGURATION) do |config|
end
