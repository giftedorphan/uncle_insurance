class Client < BaseRecord
  has_many :insurances

  validates_presence_of :dni, :first_name

  validates :dni, uniqueness: true
end