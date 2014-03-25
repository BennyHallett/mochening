require "mochening/version"

module Mochening
  class Expect
    def self.from(db)
      raise "Cannot expect anything from a nil database" if db.nil?
    end
  end
end
