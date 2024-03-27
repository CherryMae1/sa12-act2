require 'httparty'

response = HTTParty.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd')
data = JSON.parse(response.body)

def top_5_market_cap(data)
  top_5 = data.sort_by{ |x| -x['market_cap']}
end

def display_top_5(data)
  data.each_with_index do |x, index|
    if index <= 4
      info = x['name'],
      current_price = x['current_price'],
      market_cap = x['market_cap']

      puts "Rank#{index+1}: #{info}"
    end
  end
end

x = top_5_market_cap(data)
y = (display_top_5(x))
