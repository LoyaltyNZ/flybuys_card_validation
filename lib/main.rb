require "validator"

class Main
  def initialize(input: $stdin, output: $stdout)
    @input = input
    @output = output
  end

  def run
    @output.puts(validator.greeting)
    input = @input.gets.strip.delete(" ")
    @output.puts "#{validator.find_colour(input)}: #{input} (#{validator.validate(input)})"
  end

  private

  attr_reader :output

  def validator
    @validator ||= Validator.new
  end
end
