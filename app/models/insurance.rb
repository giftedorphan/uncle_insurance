class Insurance < BaseRecord
  extend FriendlyId
  friendly_id :name_and_sequence, use: :slugged

  belongs_to :client
  belongs_to :company

  validates_presence_of :client_id, :company_id, :acquisition, :due_date

  def slug_candidates
    [:company_id, :name_and_sequence]
  end

  def name_and_sequence
    slug = (Company.where(id: company_id).pluck(:name)).to_param
    sequence = Insurance.where("slug like '#{slug}-%'").count + 1
    "#{slug}--#{sequence}"
  end
end