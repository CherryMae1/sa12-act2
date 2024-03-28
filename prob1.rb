require 'httparty'

response = HTTParty.get('https://api.github.com/users/CherryMae1/repos')


if response.code == 200
  data = JSON.parse(response.body)

  def most_starred_repo(data)
    max_star = data.max{ |x| x['stargazers_count']}
    {
      name: max_star['name'],
      description: max_star['description'],
      star_count: max_star['stargazers_count'],
      repo_url: max_star['html_url'],
    }
  end

  def display_repo(data)
    puts "Name: #{data[:name]}"
    puts "Description: #{data[:description]}"
    puts "Count Stars: #{data[:star_count]}"
    puts "Repo URL: #{data[:repo_url]}"
  end

  x = most_starred_repo(data)
  y = (display_repo(x))

else
  puts "Error retrieving events: #{response.code}"
end
