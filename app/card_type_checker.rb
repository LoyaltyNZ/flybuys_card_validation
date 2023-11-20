require_relative '../app/card_number_processor'

class CardTypeChecker < CardNumberProcessor
  def determine_card_type
    return 'Unknown' unless @card_number.start_with?('6014')

    length = @card_number.length

    case valid_card_number_format?(@card_number)
    when black_card?(length)
      return 'Flybuys Black'
    when red_card?(length)
      return 'Flybuys Red'
    when green_card?(length)
      return 'Flybuys Green'
    else
      return 'Flybuys Blue'
    end
  end

  private

  def black_card?(length)
    (@card_number[4] == '1') && (length == 16 || length == 17)
  end
  
  def red_card?(length)
    @card_number.start_with?('6014352') && length == 16
  end
  
  def green_card?(length)
    @card_number.start_with?('601435552') &&
      (6..9).include?(@card_number[9].to_i) &&
      length == 16
  end
end