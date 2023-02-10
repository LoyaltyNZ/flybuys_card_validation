require 'fly_buys/card'

describe FlyBuys::Card::Blue do
  subject(:card) { described_class.new(number) }

  let(:number) { '6014709045001234' }

  context 'with a valid blue card' do
    it { is_expected.to be_valid }
  end

  context 'with an invalid blue card' do
    let(:number) { '6014709045001235' }

    it { is_expected.not_to be_valid }
  end

  context 'with a red card number' do
    let(:number) { '6014352700000140' }

    it { is_expected.not_to be_valid }
  end

  describe '#tier' do
    subject(:tier) { card.tier }

    context 'with a valid blue card' do
      it { is_expected.to eq 'Fly Buys Blue' }
    end
  end
end
