require 'httparty'

response = HTTParty.get('http://worldtimeapi.org/api/timezone/Asia/Bangkok')
data = JSON.parse(response.body)

date = data['datetime']
datetime = date.match(/(\d{4}\-\d{1,2}\-\d{1,2})/)

time = data['datetime']
current_time = time.match(/(\d{2}\:\d{2}\:\d{2})/)


puts "The current time in #{data['timezone']} is #{datetime} #{current_time}."
