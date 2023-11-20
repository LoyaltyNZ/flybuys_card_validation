require_relative '../app/card_number_processor'

class CardValidityChecker < CardNumberProcessor
  def check_validity
    return validate_card_number(@card_number)
  end

  private

  def validate_card_number(card_number)
    digits = card_number.chars.map(&:to_i)
    doubled_digits = []
  
    digits.reverse.each_with_index do |digit, index|
      if index.odd?
        doubled = digit * 2
        doubled = doubled.digits.sum if doubled > 9
        doubled_digits << doubled
      else
        doubled_digits << digit
      end
    end
  
    total = doubled_digits.sum
    valid = (total % 10).zero? ? 'valid' : 'invalid'

    return valid
  end
end