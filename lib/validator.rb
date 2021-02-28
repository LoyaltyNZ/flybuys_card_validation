class Validator
  def greeting
    "Enter a card number"
  end

  def find_colour(card_number)
    length = card_number.length

    if card_number.start_with?("60141") && length.between?(16, 17)
      "Fly Buys Black"
    elsif card_number.start_with?("6014352") && length == 16
      "Fly Buys Red"
    elsif card_number[0..9].to_i.between?(6014355526, 6014355529) && length == 16
      "Fly Buys Green"
    elsif card_number.start_with?("6014") && length == 16
      "Fly Buys Blue"
    else
      "Unknown"
    end
  end

  def validate(card_number)
    return "invalid" unless card_number.length.between?(16, 17)

    arr = card_number.split("").reverse.map(&:to_i)
    arr = arr.map.with_index {|n, i| i.odd? ? n * 2 : n } 
    nums = arr.join.chars.map(&:to_i)
    sum = nums.sum
    sum % 10 == 0 ? @validity = "valid" : @validity = "invalid"
  end
end