class HomesController < ApplicationController
  def index
    @locations = Lawyer.all.map(&:location).uniq
    @services = Service.all.map(&:name)
  end
end
