class EtaFetcher
  ETA_BASE_URL = 'https://gtfsapi.metrarail.com'.freeze
  ALERTS       = '/gtfs/alerts'.freeze
  POSITIONS    = '/gtfs/positions'.freeze
  TRIP_UPDATES = '/gtfs/tripUpdates'.freeze
  ACCESS_KEY   = 'change to env var'
  SECRET_KEY   = 'change to env var'

  def self.fetch
    positions_url = ETA_BASE_URL + POSITIONS
    svc = Services::Web.new positions_url, {user_name: ACCESS_KEY, password: SECRET_KEY}
    response = svc.get
  end
end

