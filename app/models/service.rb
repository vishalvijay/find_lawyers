class Service < ActiveRecord::Base
  validates_presence_of :code, :name
  validates :code, uniqueness: true
  has_many :service_charges
  has_many :lawyers, through: :service_charges
end
