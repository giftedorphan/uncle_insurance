class AddRenovationToInsurances < ActiveRecord::Migration[5.0]
  def change
    add_column :insurances, :renovation, :boolean

    add_index :insurances, :renovation
  end
end