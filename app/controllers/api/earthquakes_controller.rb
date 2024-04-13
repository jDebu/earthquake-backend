class Api::EarthquakesController < ApiController
  include EarthquakesHelper

  before_action :validate_params, only: [:index]
  before_action :set_earthquake, only: [:show]

  def index
    @earthquakes = filtered_earthquakes(@filtered_params)
    @earthquakes = @earthquakes.page(params[:page] || 1).per(params[:per_page] || 10)
  end

  def show; end

  private

  def filtered_earthquakes(filter_params)
    if filter_params[:mag_type].present?
      Earthquake.where(magnitude_type: filter_params[:mag_type])
    else
      Earthquake.all
    end
  end

  def validate_params
    per_page = validate_per_page(params[:per_page])
    unless per_page
      render json: { error: "Invalid 'per_page' parameter. Must be less than or equal to #{MAX_PER_PAGE}" }, status: :unprocessable_entity
      return
    end
    @filtered_params = filter_params
    if @filtered_params[:error]
      render json: { error: @filtered_params[:error] }, status: :unprocessable_entity
      return
    end
  end

  def set_earthquake
    @earthquake = Earthquake.find(params[:id])
  end

end
