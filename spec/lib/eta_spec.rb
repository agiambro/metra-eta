RSpec.describe Eta do
  describe '.minutes_delayed_to' do
    it 'gets number of minutes' do
      payload = json_fixture_data_for 'trip_updates.json'

      expect(Services::MetraApi).to receive(:fetch).with('trip_updates') { payload }
      expect(Eta.minutes_delayed_to('OAKPARK')).to eq 3
    end

    #TODO cover edge cases
  end
end
