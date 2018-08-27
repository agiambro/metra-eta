module Services
  RSpec.describe MetraApi do
    describe '.fetch' do
      context 'invalid api name' do
        it 'raises error' do
          expect{ MetraApi.fetch('na') }.to raise_error(/invalid api/i)
        end
      end
    end
  end
end