class LawyersController < ApplicationController
  respond_to :json
  def search
    result = nil
    if params[:location].present? && params[:service].present?
      result = Lawyer.where(location: params[:location]).joins(:services).where(services: {name: params[:service]})
    elsif params[:location].present?
      result = Lawyer.where(location: params[:location])
    elsif params[:service].present?
      result = Lawyer.joins(:services).where(services: {name: params[:service]})
    else
      result = Lawyer
    end
    respond_with result.order("average_rating desc")
  end
end
