require_relative '../app/card_number_processor'

RSpec.describe CardNumberProcessor do
  let(:valid_black_card_number_16_digits) { '6014111100033006' }
  let(:valid_black_card_number_17_digits) { '60141016700078611' }
  let(:invalid_black_card_number) { '6014152705006141' }

  let(:valid_red_card_number) { '6014352700000140' }
  let(:invalid_red_card_number) { '' }

  let(:valid_green_card_number) { '6014355526000020' }
  let(:invalid_green_card_number) { '6014355529000028' }

  let(:valid_blue_card_number) { '6014709045001234' }
  let(:invalid_blue_card_number) { '60141016700078611' }

  let(:unknown_card_number) { '6013111111111111' }
  
  describe '#initialize' do
    let(:invalid_input_type) {12345}
    let(:invalid_input_length) {'12345'}
    let(:invalid_input_characters) {'ABCDEF-6700078611'}

    context 'with a valid card number' do
      it 'initializes a CardNumberProcessor object' do
        expect { CardNumberProcessor.new(valid_red_card_number) }.not_to raise_error
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
    context 'when a valid card number' do
      context 'of Flybuys Black type' do
        it 'returns the correct type for a 16 digit number' do
          processor = CardNumberProcessor.new(valid_black_card_number_16_digits)

          expect(processor.card_type).to eq('Flybuys Black')
        end
      
        it 'returns the correct type for a 17 digit number' do
          processor = CardNumberProcessor.new(valid_black_card_number_17_digits)

          expect(processor.card_type).to eq('Flybuys Black')
        end
      end

      it 'returns the correct type for Flybuys Red numbers' do
        processor = CardNumberProcessor.new(valid_red_card_number)

        expect(processor.card_type).to eq('Flybuys Red')
      end

      it 'returns the correct type for Flybuys Green numbers' do
        processor = CardNumberProcessor.new(valid_green_card_number)

        expect(processor.card_type).to eq('Flybuys Green')
      end

      it 'returns the correct type for Flybuys Blue numbers' do
        processor = CardNumberProcessor.new(valid_blue_card_number)

        expect(processor.card_type).to eq('Flybuys Blue')
      end
    end

    it 'handles unknown card numbers appropriately' do
      processor = CardNumberProcessor.new(unknown_card_number)

      expect(processor.card_type).to eq('Unknown')
    end
  end

  describe '#valid?' do
    it 'returns "valid" for a valid card number' do
      processor = CardNumberProcessor.new(valid_black_card_number_16_digits)

      expect(processor.valid?).to eq('valid')
    end

    it 'handles invalid card numbers appropriately' do
      processor = CardNumberProcessor.new(valid_black_card_number_16_digits)

      expect(processor.valid?).to eq('invalid')
    end
  end
end
