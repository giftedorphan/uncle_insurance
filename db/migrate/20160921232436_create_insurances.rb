class CreateInsurances < ActiveRecord::Migration[5.0]
  def change
    create_table(:insurances, id: :uuid) do |t|
      t.uuid   :client_id,    null: false
      t.uuid   :company_id,   null: false
      t.string :link,         null: true
      t.date   :acquisition,  null: false
      t.date   :due_date,     null: false

      t.timestamps
    end
  end
end