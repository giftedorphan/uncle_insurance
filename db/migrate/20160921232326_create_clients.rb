class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table(:clients, id: :uuid) do |t|
      t.string :dni,        null: false
      t.string :first_name, null: false
      t.string :last_name,  null: false

      t.timestamps
    end

    add_index :clients, :dni, unique: true
  end
end