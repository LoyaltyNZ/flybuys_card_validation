module FlyBuys
  class Card
    class Red < Card
      def self.include?(number)
        number.match?(/\A6014352(\d){9}\z/)
      end

      def tier
        'Fly Buys Red'
      end
    end
  end
end
