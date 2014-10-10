class ServiceCharge < ActiveRecord::Base
  belongs_to :lawyer
  belongs_to :service
  validates_presence_of :charge, :lawyer, :service
end
