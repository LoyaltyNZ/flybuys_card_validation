require "main"

RSpec.describe Main do
 
    it "prints the card type, number and validity status" do
        output = ask_for_number_with_input("60141016700078611")

        expect(output).to eq <<~OUTPUT
        Enter a card number
        Fly Buys Black: 60141016700078611 (valid)
        OUTPUT
    end

    def ask_for_number_with_input(card_number)
        input = StringIO.new(card_number + "\n")
        output = StringIO.new

        main = Main.new(input: input, output: output)
        main.run
        output.string
    end
end
