class AddPaymentAndCommentsToInsurances < ActiveRecord::Migration[5.0]
  def change
    add_column :insurances, :payment, :boolean
    add_column :insurances, :comments, :text

    add_index :insurances, :payment
  end
end