require_relative '../app/card_number_processor'
require_relative '../app/card_type_checker'
require_relative '../app/card_validity_checker'

def process_card_numbers(card_numbers)
  card_numbers.each do |number|
    card_number = number.to_s.delete(' \t\n')
    processor = CardNumberProcessor.new(card_number)
    card_type = processor.card_type
    validity = processor.valid?
    puts "#{card_type}: #{card_number} (#{validity})"
  end
end

card_numbers = [
  '60141016700078611',
  '6014152705006141',
  '6014111100033006',
  '6014709045001234',
  '6014352700000140',
  '6014355526000020',
  '6014 3555 2900 0028',
  '6013111111111111'
]

process_card_numbers(card_numbers)
