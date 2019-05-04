require 'json'
require 'net/http'
require 'uri'

STATUS_KEYS =
  %w[heartbeat storage_read storage_write db_read db_write].freeze

uri = URI.parse('http://localhost:9292/health')
response = Net::HTTP.get_response(uri)

exit 1 if response.code != '200'

STATUS_KEYS.each do |key|
  next if JSON.parse(response.body)['status'][key] == 'OK'

  exit 1
end

exit 0
