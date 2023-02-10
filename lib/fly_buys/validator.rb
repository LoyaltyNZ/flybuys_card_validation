require_relative 'card'

module FlyBuys
  class Validator
    attr_reader :number

    def initialize(number)
      @number = Card.normalize(number)
    end

    def valid?
      !number.empty? && checksum.zero?
    end

    private

    def digits
      @digits ||= number.chars.map(&:to_i)
    end

    def checksum
      doubled = digits.reverse.each_slice(2).flat_map do |first, second|
        second ? [first, (second * 2).digits.sum] : first
      end
      doubled.sum % 10
    end
  end
end
