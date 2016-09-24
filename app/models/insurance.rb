class Insurance < BaseRecord
  belongs_to :client
  belongs_to :company

  validates_presence_of :client_id, :company_id, :acquisition, :due_date
end