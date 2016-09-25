class Company < BaseRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :insurances, :dependent => :destroy

  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false

  def should_generate_new_friendly_id?
    name_changed?
  end
end