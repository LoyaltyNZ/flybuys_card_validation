require_relative 'card/black'
require_relative 'card/red'
require_relative 'card/green'
require_relative 'card/blue'
require_relative 'validator'

module FlyBuys
  class Card
    attr_reader :number

    def initialize(number)
      @number = number
    end

    def self.from_number(number)
      number = normalize(number)
      klass = subclasses.detect { |k| k.include?(number) } || self
      klass.new(number)
    end

    def self.include?(_number)
      true
    end

    def self.normalize(number)
      number.gsub(/\s+/, '')
    end

    def to_s
      "#{tier}: #{number} (#{valid? ? 'valid' : 'invalid'})"
    end

    def valid?
      self.class.include?(number) && Validator.new(number).valid?
    end

    def tier
      'Unknown'
    end
  end
end
