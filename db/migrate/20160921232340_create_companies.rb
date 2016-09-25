class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table(:companies, id: :uuid) do |t|
      t.string :name

      t.timestamps
    end

    add_index :companies, :name,                unique: true
  end
end