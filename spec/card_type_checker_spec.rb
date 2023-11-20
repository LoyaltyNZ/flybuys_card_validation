require_relative '../app/card_type_checker'

RSpec.describe CardTypeChecker do
  let(:valid_black_card_number_16_digits) { '6014111100033006' }
  let(:valid_black_card_number_17_digits) { '60141016700078611' }
  let(:valid_red_card_number) { '6014352700000140' }
  let(:valid_green_card_number) { '6014355526000020' }
  let(:valid_blue_card_number) { '6014709045001234' }
  let(:unknown_card_number) { '6013111111111111' }

  describe '#determine_card_type' do
    context 'when a known card number' do
      context 'of Flybuys Black type' do
        it 'returns the correct type for a 16 digit number' do
          processor = CardTypeChecker.new(valid_black_card_number_16_digits)

          expect(processor.card_type).to eq('Flybuys Black')
        end
      
        it 'returns the correct type for a 17 digit number' do
          processor = CardTypeChecker.new(valid_black_card_number_17_digits)

          expect(processor.card_type).to eq('Flybuys Black')
        end
      end

      it 'returns the correct type for Flybuys Red numbers' do
        processor = CardTypeChecker.new(valid_red_card_number)

        expect(processor.card_type).to eq('Flybuys Red')
      end

      it 'returns the correct type for Flybuys Green numbers' do
        processor = CardTypeChecker.new(valid_green_card_number)

        expect(processor.card_type).to eq('Flybuys Green')
      end

      it 'returns the correct type for Flybuys Blue numbers' do
        processor = CardTypeChecker.new(valid_blue_card_number)

        expect(processor.card_type).to eq('Flybuys Blue')
      end
    end

    it 'handles unknown card numbers appropriately' do
      processor = CardTypeChecker.new(unknown_card_number)

      expect(processor.card_type).to eq('Unknown')
    end
  end
end