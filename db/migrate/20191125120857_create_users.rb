ROM::SQL.migration do
  change do
    create_table :users do
      primary_key :id
      column :nickname, String, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end
end
