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
      puts "Teste 1 - #{response.code}"
      puts "Teste 1 - #{response.message}"
    end
  end

  it 'Causando o erro 404 de página não encontrada' do
    begin
      response = TesteAPI.get('/pokemon/0/')
      expect(response.code).to eql(404)
      expect(response['name']).to eql(nil)
      puts "Teste 2 - #{response.code}"
      puts "Teste 2 - #{response.message}"
    end

    # Causando o erro com o expect.
    begin
      response = TesteAPI.get('/pokemon/1/')
      expect(response.code).to eql(404)
      expect(response['name']).to eql(nil)
      puts "Teste 3 - #{response.code}"
      puts "Teste 3 - #{response.message}"
    end
  end
end

RSpec.describe 'Teste de API - POST' do
  it 'Inserindo um Pokemon' do

    novo_pokemon = {
	"forms": [
		{
			"url": "https://pokeapi.co/api/v2/pokemon-form/1/",
			"name": "Teste"
		}
	]}

    begin
      response = TesteAPI.post('/pokemon/1/', body: novo_pokemon)
      expect(response.code).to eql(201)
      puts "Teste 3 - #{response.code}"
      puts "Teste 3 - #{response.message}"
    end
  end
end


# puts response.body, response.code, response.message, response.headers.inspect

=begin
Codigos usados:
200 - O servidor processou a solicitação com sucesso.
404 - O servidor não encontrou a página solicitada.
201 - A solicitação foi bem-sucedida e o servidor criou um novo recurso.

Obs.: A API pokeapi, segundo sua documentação, é uma API apeans de consumo utilizando GET (This is a consumption-only API - only the HTTP GET method is available on resources).

=end