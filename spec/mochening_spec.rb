require 'mochening'

RSpec.configure do |config|
  config.mock_framework = :mocha
end

describe Mochening do
  it "raises error when called with nil database" do
    expect { Mochening::Expect.from(nil) }.to raise_error(RuntimeError)
  end

  it "raises error when called without a block" do
    db = mock('object')
    expect { Mochening::Expect.from(db) }.to raise_error(RuntimeError)
  end
end
