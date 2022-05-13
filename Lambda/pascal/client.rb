require 'json'
require 'faraday'

URL = 'https://xs5ksjsoe5.execute-api.us-west-2.amazonaws.com/default/pascal'

connection = Faraday.new(url: URL)
res = connection.get do |req|
  req.params['n'] = 20
end

if res.success?
  data = JSON.parse(res.body)
  p data['result']
end