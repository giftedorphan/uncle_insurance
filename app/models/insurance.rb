class Insurance < BaseRecord
  extend FriendlyId
  friendly_id :name_and_sequence, use: :slugged

  belongs_to :client
  belongs_to :company

  validates_presence_of :client_id, :company_id, :acquisition, :due_date

  def name_and_sequence
    slug = (Company.where(id: company_id).pluck(:name)).to_param
    sequence = Insurance.where("slug like '#{slug}-%'").count + 1
    "#{slug}--#{sequence}"
  end

  def should_generate_new_friendly_id?
    company_id_changed?
  end

  def self.search(date)
    if date[:month].empty?
      where('extract(year from acquisition) = ?', date[:year])
    elsif date[:year].empty?
      where('extract(month from acquisition) = ?', date[:month])
    else
      where('extract(year from acquisition) = ? AND extract(month from acquisition) = ?', date[:year], date[:month])
    end
  end
end