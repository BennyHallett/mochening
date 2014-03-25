require 'mochening'

describe Mochening do
  it "raises error when called with nil database" do
    expect { Mochening::Expect.from(nil) }.to raise_error(RuntimeError)
  end

  it "raises error when called without a block" do
    db = double('database')
    expect { Mochening::Expect.from(db) }.to raise_error(RuntimeError)
  end

  it "sets an expectation on the db that a dataset is created" do
    db = double('database')
    expect(db).to receive(:expects).with(:[]).and_return(db)
    expect(db).to receive(:with).with(:table)

    Mochening::Expect.from(db) do |dbase|
      dbase[:table]
    end
  end

  it "sets an expectation on the db that the dataset is restricted to a set of values" do
    restriction = { a: 'a', b: 'b' }
    db = double('database')
    expect(db).to receive(:expects).with(:[]).and_return(db)
    expect(db).to receive(:with).with(:table).and_return(db)
    expect(db).to receive(:expects).with(:where).and_return(db)
    expect(db).to receive(:with).with(restriction)

    Mochening::Expect.from(db) do |dbase|
      dbase[:table].where(a: 'a', b: 'b')
    end
  end
end
