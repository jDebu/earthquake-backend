json.data @earthquakes, partial: 'earthquake', as: :earthquake

json.pagination do
  json.current_page @earthquakes.current_page
  json.total @earthquakes.total_count
  json.per_page @earthquakes.limit_value
end