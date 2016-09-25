class AddSlugToInsurances < ActiveRecord::Migration[5.0]
  def change
    add_column :insurances, :slug, :string
    add_index :insurances, :slug, unique: true
  end
end