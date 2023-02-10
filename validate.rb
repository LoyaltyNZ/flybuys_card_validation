#!/usr/bin/env ruby

require 'rubygems'
require_relative 'lib/fly_buys/card'

$stdin.each_line do |card_number|
  card = FlyBuys::Card.from_number(card_number.chomp)
  puts card.to_s
end
