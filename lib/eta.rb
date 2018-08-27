class Eta
  UNION_PACIFIC_WEST_LINE_ID = 'UP-W_UW509_V6_D'

  def self.minutes_delayed_to station_name
    station_name = station_name.upcase
    raw_updates = Services::MetraApi.fetch 'trip_updates'

    el = raw_updates.find{|p| p['id'] == UNION_PACIFIC_WEST_LINE_ID}
    return 0 if el.nil?

    updates = el.dig 'trip_update', 'stop_time_update'
    return 0 if updates.nil?

    station_update = updates.find{|i| i['stop_id'] == station_name}
    return 0 if station_update.nil?

    delay = station_update.dig 'arrival', 'delay'
    return 0 if delay.nil?

    (delay / 60.to_f).round
  end
end
