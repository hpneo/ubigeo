require 'dalli'
require 'sinatra'
require 'rack/deflater'
require 'rack/cache'
require 'json'
require_relative './ubigeo'
require_relative './directorio'
require_relative './endpoints/legacy'
require_relative './endpoints/v1'
require_relative './endpoints/v2'

class Application < Sinatra::Base
  set :protection, :except => :json_csrf
  use Rack::Deflater

  if ENV['MEMCACHEDCLOUD_SERVERS']
    dalli = Dalli::Client.new(
      ENV['MEMCACHEDCLOUD_SERVERS'].split(','),
      username: ENV['MEMCACHEDCLOUD_USERNAME'],
      password: ENV['MEMCACHEDCLOUD_PASSWORD']
    )

    use Rack::Cache,
        verbose: true,
        metastore: dalli,
        entitystore: dalli
  end

  before do
    cache_control :public, :must_revalidate, max_age: 604800

    if request.request_method == 'OPTIONS'
      response.headers["Access-Control-Allow-Origin"] = "*"
      response.headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS"
      response.headers["Access-Control-Max-Age"] = "1000"
      response.headers["Access-Control-Allow-Headers"] = "*,x-requested-with"
      halt 200
    end
  end

  use Legacy
  use V1
  use V2
end
