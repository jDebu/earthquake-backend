require 'net/http'
require 'json'

namespace :earthquake_data do
  desc "Obtain seismic data from USGS GeoJSON feed"
  task fetch: :environment do
    url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_month.geojson'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    earthquakes = data['features']
    created_count = 0 
    puts "processing #{earthquakes.count} records"
    
    earthquakes.each do |quake|
      properties = quake['properties']
      geometry = quake['geometry']['coordinates']
      begin
        external_id = quake['id']
        Earthquake.create!(
          external_id:,
          magnitude: properties['mag'].to_f,
          place: properties['place'],
          time: Time.at(properties['time'] / 1000).to_datetime,
          url: properties['url'],
          tsunami: properties['tsunami'],
          magnitude_type: properties['magType'],
          title: properties['title'],
          longitude: geometry[0].to_f,
          latitude: geometry[1].to_f
        )
        created_count += 1
      rescue ActiveRecord::RecordInvalid => e
        puts "Error #{external_id}: #{e.message}"
        next
      end
    end

    puts "Seismic data obtained and stored successfully."
    puts "Created #{created_count} new records."
  end
end
