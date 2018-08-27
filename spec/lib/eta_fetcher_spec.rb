RSpec.describe EtaFetcher do
  describe '.fetch' do
    context 'invalid api name' do
      it 'raises error' do
        expect{ EtaFetcher.fetch('na') }.to raise_error(/invalid api/i)
      end
    end
  end
end
