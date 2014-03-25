require "mochening/version"

module Mochening
  class Expect
    def self.from(db)
      raise "Cannot expect anything from a nil database" if db.nil?
      raise "Expected a block" unless block_given?
      yield Mochening::Expect.new(db)
    end

    def initialize(db)
      @db = db
    end

    def [](table)
      @db.expects(:[]).with(table)
      self
    end

    def where(restriction)
      @db.expects(:where).with(restriction)
      self
    end

    def select(*columns)
      @db.expects(:select).with(*columns)
      self
    end

    def all(return_value)
      @db.expects(:all).returns(return_value)
    end

    def first(return_value)
      @db.expects(:first).returns(return_value)
    end
  end
end
