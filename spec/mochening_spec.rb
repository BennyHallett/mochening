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

  it "sets an expectations on the db that a set of values is selected from the dataset" do
    db = double('database')
    expect(db).to receive(:expects).with(:[]).and_return(db)
    expect(db).to receive(:with).with(:table).and_return(db)
    expect(db).to receive(:expects).with(:select).and_return(db)
    expect(db).to receive(:with).with(:a, :b)

    Mochening::Expect.from(db) do |dbase|
      dbase[:table].select(:a, :b)
    end
  end

  it "returns all values of a selected data set" do
    return_value = [ { a: 'aa', b: 'bb' }, { a: '12', b: '34' } ]

    db = double('database')
    expect(db).to receive(:expects).with(:[]).and_return(db)
    expect(db).to receive(:with).with(:table)
    expect(db).to receive(:expects).with(:where).and_return(db)
    expect(db).to receive(:with).with(c: 'c')
    expect(db).to receive(:expects).with(:select).and_return(db)
    expect(db).to receive(:with).with(:a, :b)
    expect(db).to receive(:expects).with(:all).and_return(db)
    expect(db).to receive(:returns).with(return_value)

    Mochening::Expect.from(db) do |dbase|
      dbase[:table].where(c: 'c').select(:a, :b).all return_value
    end
  end

  it "returns first value of a selected data set" do
    return_value = { a: 'aa', b: 'bb', c: 'c' }

    db = double('database')
    expect(db).to receive(:expects).with(:[]).and_return(db)
    expect(db).to receive(:with).with(:table)
    expect(db).to receive(:expects).with(:where).and_return(db)
    expect(db).to receive(:with).with(c: 'c')
    expect(db).to receive(:expects).with(:first).and_return(db)
    expect(db).to receive(:returns).with(return_value)

    Mochening::Expect.from(db) do |dbase|
      dbase[:table].where(c: 'c').first return_value
    end
  end
end
