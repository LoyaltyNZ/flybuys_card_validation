describe 'validate' do # rubocop:disable RSpec/DescribeClass
  let(:input) do
    <<~INPUT
      60141016700078611
      6014152705006141
      6014111100033006
      6014709045001234
      6014352700000140
      6014355526000020
      6014 3555 2900 0028
      6013111111111111
    INPUT
  end

  let(:expected_output) do
    <<~OUTPUT
      Fly Buys Black: 60141016700078611 (valid)
      Fly Buys Black: 6014152705006141 (invalid)
      Fly Buys Black: 6014111100033006 (valid)
      Fly Buys Blue: 6014709045001234 (valid)
      Fly Buys Red: 6014352700000140 (valid)
      Fly Buys Green: 6014355526000020 (valid)
      Fly Buys Green: 6014355529000028 (invalid)
      Unknown: 6013111111111111 (invalid)
    OUTPUT
  end

  let(:output_buffer) { StringIO.new }

  around do |example|
    stdin = $stdin
    $stdin = StringIO.new(input)
    example.run
    $stdin = stdin
  end

  it 'provides correct validation output' do
    expect { require_relative '../validate' }
      .to output(expected_output)
      .to_stdout
  end
end
