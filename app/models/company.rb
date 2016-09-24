class Company < BaseRecord
  has_many :insurances

  validates :name, presence: true
  validates :name, uniqueness: true
end