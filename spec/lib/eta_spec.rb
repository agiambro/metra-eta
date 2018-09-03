RSpec.describe Eta do
  describe '.minutes_delayed_to' do
    context 'multiple trip versions' do
      it 'gets number of minutes' do
        Eta::TRIP_PREFIX_ID = 'UP-W_UW509'
        payload = json_fixture_data_for 'trip_updates.json'
        expect(Services::MetraApi).to receive(:fetch).with('trip_updates') { payload }
        expect(Eta.minutes_delayed_to('OAKPARK')).to eq 6
      end
    end

    context 'one trip version' do
      it 'gets number of minutes' do
        Eta::TRIP_PREFIX_ID = 'UP-W_UW36'
        payload = json_fixture_data_for 'trip_updates.json'
        expect(Services::MetraApi).to receive(:fetch).with('trip_updates') { payload }
        expect(Eta.minutes_delayed_to('OAKPARK')).to eq 3
      end
    end
  end
end
