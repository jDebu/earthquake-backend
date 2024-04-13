json.id earthquake.id
json.type 'feature'
json.attributes do
  json.external_id earthquake.external_id
  json.magnitude earthquake.magnitude.to_f
  json.place earthquake.place
  json.time earthquake.time.strftime('%Y-%m-%d %H:%M:%S')
  json.tsunami earthquake.tsunami
  json.mag_type earthquake.magnitude_type
  json.title earthquake.title
  json.coordinates do
    json.longitude earthquake.longitude.to_f
    json.latitude earthquake.latitude.to_f
  end
end
json.links do
  json.external_url earthquake.url
end