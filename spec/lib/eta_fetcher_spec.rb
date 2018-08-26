RSpec.describe EtaFetcher do
  describe '.fetch' do
    context 'trip_updates' do
      it 'does something' do
        data = json_fixture_data_for 'positions.json'
        expect(data.first["id"]).to eq '8426'
      end
    end
  end
end
