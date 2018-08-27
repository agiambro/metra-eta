class EtaFetcher
  ACCESS_KEY   = ENV["METRA_ACCESS_KEY"]
  SECRET_KEY   = ENV["METRA_SECRET_KEY"]
  ETA_BASE_URL = 'https://gtfsapi.metrarail.com'.freeze
  APIS = {
    alerts: 'gtfs/alerts',
    positions: 'gtfs/positions',
    trip_updates: 'gtfs/tripUpdates'
  }.freeze

  def self.fetch api_name
    api_sym = api_name.to_sym
    raise 'Invalid API name' if APIS[api_sym].nil?
    api_url = ETA_BASE_URL + APIS[api_sym]
    svc = Services::Web.new api_url, {user_name: ACCESS_KEY, password: SECRET_KEY}
    svc.get
  end
end
