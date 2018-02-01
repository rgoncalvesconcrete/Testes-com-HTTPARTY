require 'httparty'

class TesteAPI
  include HTTParty
  base_uri 'https://pokeapi.co/api/v2'
end

RSpec.describe 'Teste de API - GET' do
  it 'Retornando um Pokemon' do
    begin
      response = TesteAPI.get('/pokemon/1/')
      expect(response.code).to eql(200)
      expect(response['name']).to eql('bulbasaur')

      puts response
    end
  end
end

# RSpec.describe 'Teste de API - GET' do
#     it 'Retornando um Pokemon 222' do
#       begin
#         response = TesteAPI.get('/pokemon/-1/')
#         expect(response.code).to eql(200)
#         #xpect(response['name']).to eql(200)
#       end
#     end
#   end

# require 'json'

# response = HTTParty.get('https://pokeapi.co/api/v2/pokemon/1/')
# puts response.body, response.code, response.message, response.headers.inspect

# puts "Status HTTP: #{response.code}"
# puts "Status Mensagem: #{response.message}"

# dados = response.parsed_response['forms']

# puts dados

# dados.each do |valor|
#   puts valor['name']
#  # puts valor["weight"]

# end
