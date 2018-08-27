module Services
  RSpec.describe MetraApi do
    describe '.fetch' do
      context 'invalid' do
        context 'api name' do
          it 'raises error' do
            expect{ MetraApi.fetch('na') }.to raise_error(/invalid api/i)
          end
        end

        context 'http request in test' do
          it 'raises error' do
            expect{ MetraApi.fetch('positions') }.to raise_error WebMock::NetConnectNotAllowedError
          end
        end
      end

      context 'valid api name' do
        it 'returns payload' do
          svc = double(Services::Web)
          expect(Services::Web).to receive(:new) { svc }
          expect(svc).to receive(:get)
          MetraApi.fetch('positions')
        end
      end
    end
  end
end
