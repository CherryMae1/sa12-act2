require 'httparty'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')

if response.code == 200
  data = JSON.parse(response.body)

  def top_5_market_cap(data)
    top_5 = data.sort_by{ |x| -x['market_cap']}
  end

  def display_top_5(data)
    data.each_with_index do |x, index|
      if index <= 4
        puts "Rank #{index+1}"
        puts "Name:#{x['name']}"
        puts "Current Price:#{x['current_price']}"
        puts "Market Cap:#{x['market_cap']}"
      end
    end
  end

  x = top_5_market_cap(data)
  y = (display_top_5(x))
else
  puts "Error retrieving events: #{response.code}"
end
