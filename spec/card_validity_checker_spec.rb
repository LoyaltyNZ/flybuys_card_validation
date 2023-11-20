require_relative '../app/card_validity_checker'

RSpec.describe CardValidityChecker do
  let(:valid_black_card_number_16_digits) { '6014111100033006' }
  let(:invalid_black_card_number) { '6014152705006141' }
  
  describe '#check_validity' do
    it 'handles valid card numbers appropriately' do
      processor = CardNumberProcessor.new(valid_black_card_number_16_digits)

      expect(processor.valid?).to eq('valid')
    end

    it 'handles invalid card numbers appropriately' do
      processor = CardNumberProcessor.new(invalid_black_card_number)

      expect(processor.valid?).to eq('invalid')
    end
  end
end
