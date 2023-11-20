require_relative '../app/card_number_processor'
require_relative '../app/card_type_checker'
require_relative '../app/card_validity_checker'

RSpec.describe CardNumberProcessor do
  let(:valid_black_card_number) { '6014111100033006' }
  let(:invalid_black_card_number) { '6014152705006141' }
  let(:unknown_card_number) { '6013111111111111' }

  describe '#initialize' do
    let(:invalid_input_type) {12345}
    let(:invalid_input_length) {'12345'}
    let(:invalid_input_characters) {'ABCDEF-6700078611'}

    context 'with a valid card number' do
      it 'initializes a CardNumberProcessor object' do
        expect { CardNumberProcessor.new(valid_black_card_number) }.not_to raise_error
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
    it 'returns the correct card type of a known card number' do
      card_type_checker = CardTypeChecker.new(valid_black_card_number)
      expect(card_type_checker.determine_card_type).to eq('Flybuys Black')
    end

    it 'returns the correct card type of an unknown card number' do
      card_type_checker = CardTypeChecker.new(unknown_card_number)
      expect(card_type_checker.determine_card_type).to eq('Unknown')
    end
  end

  describe '#valid?' do
    it 'returns valid for a valid card number' do
      card_validity_checker = CardValidityChecker.new(valid_black_card_number)
      expect(card_validity_checker.check_validity).to eq('valid')
    end

    it 'returns invalid for an ivalid card number' do
      card_validity_checker = CardValidityChecker.new(invalid_black_card_number)
      expect(card_validity_checker.check_validity).to eq('invalid')
    end
  end
end
