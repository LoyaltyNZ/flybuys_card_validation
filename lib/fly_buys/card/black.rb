module FlyBuys
  class Card
    class Black < Card
      def self.include?(number)
        number.match?(/\A60141(\d){11,12}\z/)
      end

      def tier
        'Fly Buys Black'
      end
    end
  end
end
