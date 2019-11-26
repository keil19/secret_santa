module User
  class Create < ROM::Commands::Create[:sql]
    relation :users
    register_as :create
    result :one

    use :timestamps
    timestamp :created_at, :updated_at
  end
end
