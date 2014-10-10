class Lawyer < ActiveRecord::Base
  validates_presence_of :code, :name, :location
  validates :code, uniqueness: true
  has_many :service_charges
  has_many :services, through: :service_charges
end
