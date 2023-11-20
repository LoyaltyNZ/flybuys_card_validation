class CardNumberProcessor
  def initialize(card_number)
    initial_validation(card_number)
    @card_number = card_number.delete(' \t\n')
  end
  
  def card_type
    CardTypeChecker.new(@card_number).determine_card_type
  end
  
  def valid?
    CardValidityChecker.new(@card_number).check_validity
  end
  
  private
  
  def initial_validation(card_number)
    raise ArgumentError, 'Invalid input type' unless card_number.is_a?(String)
    raise ArgumentError, 'Invalid card number format' unless valid_card_number_format?(card_number)
  end

  def valid_card_number_format?(card_number)
    card_number.match?(/\A\d{16,17}\z/)
  end
end
  