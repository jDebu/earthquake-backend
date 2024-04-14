set :output, 'log/cron.log'
ENV.each { |k, v | env(k, v)}

every 1.day, at: '12:00 am' do
  rake "earthquake_data:fetch"
end
# test
# every 2.minutes do
#   rake "earthquake_data:fetch"
# end
