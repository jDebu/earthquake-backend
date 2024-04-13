module EarthquakesHelper
  MAX_PER_PAGE = 1000
  ALLOWED_MAG_TYPES = %w(md ml ms mw me mi mb mlg).freeze

  def validate_per_page(per_page_param)
    per_page = per_page_param.to_i
    per_page <= MAX_PER_PAGE ? per_page : nil
  end

  def filter_params
    filtered_params = params.permit(mag_type: [])
    if filtered_params.present?
      validation_result = validate_mag_types(filtered_params[:mag_type])
      filtered_params[:error] = validation_result[:error] if validation_result && validation_result.key?(:error)
    end
    filtered_params || {}
  end

  private

  def validate_mag_types(mag_types)
    mag_types.each do |mag_type|
      unless ALLOWED_MAG_TYPES.include?(mag_type)
        return { error: "Invalid 'mag_type' value: #{mag_type}. Allowed values are: #{ALLOWED_MAG_TYPES.join(', ')}" }
      end
    end
    nil
  end
end
