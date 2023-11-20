require_relative '../app/card_number_processor'

RSpec.describe CardNumberProcessor do
  let(:valid_card_number) { '60141016700078611' }
  let(:invalid_card_number) { '6013333333333333' }
  
  describe '#initialize' do
    let(:invalid_input_type) {12345}
    let(:invalid_input_length) {'12345'}
    let(:invalid_input_characters) {'ABCDEFG6700078611'}

    context 'with a valid card number' do
      it 'initializes a CardNumberProcessor object' do
        expect { CardNumberProcessor.new(valid_card_number) }.not_to raise_error
      end
    end

    context 'with an invalid card number' do
      it 'raises an ArgumentError for invalid input type' do
        expect { CardNumberProcessor.new(invalid_input_type) }.to raise_error(ArgumentError, 'Invalid input type')
      end

      it 'raises an ArgumentError for invalid card number length' do
        expect { CardNumberProcessor.new(invalid_input_length) }.to raise_error(ArgumentError, 'Invalid card number format')
      end

      it 'raises an ArgumentError for invalid card number characters' do
        expect { CardNumberProcessor.new(invalid_input_characters) }.to raise_error(ArgumentError, 'Invalid card number format')
      end
    end
  end

  describe '#card_type' do
    it 'returns the card type for a valid card number' do
      processor = CardNumberProcessor.new(valid_card_number)

      expect(processor.card_type).to eq('Flybuys blue')
    end

    it 'handles invalid card numbers appropriately' do
      processor = CardNumberProcessor.new(invalid_card_number)

      expect(processor.card_type).to eq('Unknown')
    end
  end

  describe '#valid?' do
    it 'returns "valid" for a valid card number' do
      processor = CardNumberProcessor.new('valid_card_number')

      expect(processor.valid?).to eq('valid')
    end

    it 'handles invalid card numbers appropriately' do
      processor = CardNumberProcessor.new('valid_card_number')

      expect(processor.valid?).to eq('invalid')
    end
  end
end
