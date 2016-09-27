class Client < BaseRecord
  extend FriendlyId
  friendly_id :custom_slug, use: :slugged

  has_many :insurances, :dependent => :destroy

  validates_presence_of :dni, :first_name
  validates :dni, uniqueness: true

  def fullname
    "#{first_name} " "#{last_name}"
  end

  def custom_slug
    "#{dni} " "#{fullname}"
  end

  def should_generate_new_friendly_id?
    first_name_changed? || last_name_changed? || dni_changed?
  end
end