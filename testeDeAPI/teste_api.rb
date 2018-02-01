require 'httparty'
#require 'json'

response = HTTParty.get('https://pokeapi.co/api/v2/pokemon/1/')
# puts response.body, response.code, response.message, response.headers.inspect


puts "Status HTTP: #{response.code}"
puts "Status Mensagem: #{response.message}"

# dados = response.parsed_response['forms']

# puts dados

# dados.each do |valor|
#   puts valor['name']
#  # puts valor["weight"] 

# end
