class AddSlugToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :slug, :string
    add_index :companies, :slug, unique: true
  end
end