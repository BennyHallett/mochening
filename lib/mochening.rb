require "mochening/version"

module Mochening
  class Expect
    def self.from(db)
      raise "Cannot expect anything from a nil database" if db.nil?
      raise "Expected a block" unless block_given?
      @db = db
    end

    def [](table)
      @db.expects(:[]).with(table)
    end
  end
end
