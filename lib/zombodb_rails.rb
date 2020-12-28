class ApplicationRecord < ActiveRecord::Base

  class << self
    def zdb_columns(*columns)
      @zdb_columns ||= []
      @zdb_columns += columns
    end

    def zdb_search(query, column: nil)
      col = column || self.zdb_columns.first
      where("#{table_name} ==> '#{col}:#{query}'")
    end
  end

end
