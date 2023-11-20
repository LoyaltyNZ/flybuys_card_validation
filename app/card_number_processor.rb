class CardNumberProcessor
  def initialize(card_number)
    initial_validation(card_number)
    @card_number = card_number
  end
  
  def card_type
    return 'Unknown'
  end
  
  def valid?
    return 'invalid'
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
  