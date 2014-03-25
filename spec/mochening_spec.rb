require 'mocha/api'
require 'mochening'

describe Mochening do
  it "raises error when called with nil database" do
    expect { Mochening::Expect.from(nil) }.to raise_error(RuntimeError)
  end
end
