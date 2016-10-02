class Insurance < BaseRecord
  extend FriendlyId
  friendly_id :name_and_sequence, use: :slugged

  belongs_to :client
  belongs_to :company

  validates_presence_of :client_id, :company_id, :acquisition, :due_date

  def name_and_sequence
    "Poliza-" + SecureRandom.hex(3)
  end

  def self.search(date)
    if date[:month].blank? && date[:year].blank?
      all
    elsif date[:month].blank?
      where('extract(year from acquisition) = ?', date[:year])
    elsif date[:year].blank?
      where('extract(month from acquisition) = ?', date[:month])
    else
      where('extract(year from acquisition) = ? AND extract(month from acquisition) = ?', date[:year], date[:month])
    end
  end
end