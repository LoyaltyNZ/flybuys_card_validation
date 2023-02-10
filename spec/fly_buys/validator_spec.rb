require 'fly_buys/validator'

describe FlyBuys::Validator do
  subject(:validator) { described_class.new(number) }

  describe '#valid?' do
    context 'with a valid black card' do
      let(:number) { '60141016700078611' }

      it { is_expected.to be_valid }
    end

    context 'with an invalid black card' do
      let(:number) { '6014152705006141' }

      it { is_expected.not_to be_valid }
    end

    context 'with a second valid black card' do
      let(:number) { '6014111100033006' }

      it { is_expected.to be_valid }
    end

    context 'with a valid blue card' do
      let(:number) { '6014709045001234' }

      it { is_expected.to be_valid }
    end

    context 'with a valid red card' do
      let(:number) { '6014352700000140' }

      it { is_expected.to be_valid }
    end

    context 'with a valid green card' do
      let(:number) { '6014355526000020' }

      it { is_expected.to be_valid }
    end

    context 'with an invalid green card' do
      let(:number) { '6014355526000028' }

      it { is_expected.not_to be_valid }
    end

    context 'with an invalid unknown card' do
      let(:number) { '6013111111111111' }

      it { is_expected.not_to be_valid }
    end
  end
end
