module FlyBuys
  class Card
    class Blue < Card
      def self.include?(number)
        number.match?(/\A6014(\d){12}\z/) && !Red.include?(number) && !Green.include?(number) && !Black.include?(number)
      end

      def tier
        'Fly Buys Blue'
      end
    end
  end
end
