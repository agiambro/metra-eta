class Eta
  TRIP_PREFIX_ID = 'UP-W_UW36'

  def self.minutes_delayed_to station_name
    station_name = station_name.upcase
    raw_updates = Services::MetraApi.fetch 'trip_updates'

    elements = raw_updates.select{|p| p['id'] =~ /#{TRIP_PREFIX_ID}/}
    return 0 if elements.empty?

    get_max_delay_for elements, station_name
  end


  private

  def self.get_max_delay_for elements, station_name
    delays = elements.each_with_object([]) do |el, accum|
      trip_updates = el.dig 'trip_update', 'stop_time_update'
      next if trip_updates.nil?

      station_updates = trip_updates.select{|i| i['stop_id'] == station_name}
      station_updates.each do |station_update|
        delay = station_update.dig 'arrival', 'delay'
        unless delay.nil?
          delay = (delay / 60.to_f).round
          accum << delay
        end
      end
    end

    max = delays.max
    max.nil? ? 0 : max
  end
end
