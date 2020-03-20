require 'dbf'
require 'ostruct'
require "active_resource/threadsafe_attributes"

class Base < OpenStruct
  class << self
    include ThreadsafeAttributes

    threadsafe_attribute :table_name, :table

    def all
      where
    end

    def where(options = {})
      table.find(:all, options).map do |row|
        new(row_to_attributes(row))
      end
    end

    def first
      row_to_attributes(table.first)
    end

    def count
      table.count
    end

    def row_to_attributes(row)
      columns.reduce({}) do |hash, column|
        hash[column] = row[column]
        hash
      end
    end

    def table
      @table ||= DBF::Table.new(table_name)
    end

    def columns
      @columns ||= self.table.columns.map(&:underscored_name)
    end
  end
end