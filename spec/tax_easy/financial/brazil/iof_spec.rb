require 'tax_easy/financial/brazil/iof'

describe TaxEasy::Financial::Brazil::IOF do
  context 'when wants to calculate loan IOF' do
    it 'returns IOF value for 22000 loan with 2.47 interest and 48 installments' do
      subject = described_class.new

      expect(subject.calculate(22_000, 48, 2.47, Date.new(2016, 06, 17))).to eq 398.10025109209266
    end

    it 'returns IOF value for 20000 loan with 1.50 interest and 48 installments' do
      subject = described_class.new

      expect(subject.calculate(20_000, 48, 1.50, Date.new(2016, 06, 17))).to eq 356.70671942746617
    end    
  end
end
