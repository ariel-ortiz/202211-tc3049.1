require 'sinatra'
require 'json'
require 'faraday'

URL = 'https://hhkar3aozg.execute-api.us-west-2.amazonaws.com/default/books'

get '/' do
  response = Faraday.get(URL)
  @info = []
  if response.success?
    @info = JSON.parse(response.body)
  end
  erb :books
end
