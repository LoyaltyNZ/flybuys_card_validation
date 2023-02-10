module FlyBuys
  class Card
    class Green < Card
      def self.include?(number)
        (6014355526..6014355529).include?(number[0, 10].to_i) && number.match?(/\A(\d){16}\z/)
      end

      def tier
        'Fly Buys Green'
      end
    end
  end
end
