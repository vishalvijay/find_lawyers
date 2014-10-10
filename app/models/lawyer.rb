class Lawyer < ActiveRecord::Base
  validates_presence_of :code, :name, :location
  validates :code, uniqueness: true
  has_many :service_charges
  has_many :services, through: :service_charges


  def as_json(options = { })
    super({except: [:created_at, :updated_at], methods: [:service_charges, :services]}.merge(options))
  end
end
