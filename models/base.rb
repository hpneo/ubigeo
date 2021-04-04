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

    def find_by(options = {})
      new(row_to_attributes(table.find(:first, options)))
    end

    def first
      new(row_to_attributes(table.find(:first)))
    end

    def last
      new(row_to_attributes(table.record(table.record_count - 1)))
    end

    def count
      table.record_count
    end

    def pluck(*column_names)
      if column_names.size > 1
        all.map do |record|
          column_names.map do |column_name|
            record[column_name]
          end
        end
      else
        column_name = column_names.first

        all.map do |record|
          record[column_name]
        end
      end
    end

    def row_to_attributes(row)
      columns.reduce({}) do |hash, column|
        hash[column] = row[column]
        hash
      end
    end

    def table
      @table ||= DBF::Table.new(table_name, nil, 'cp850')
    end

    def columns
      @columns ||= table.columns.map(&:underscored_name)
    end
  end

  def as_json
    to_h
  end

  def to_json(*args)
    as_json.to_json(*args)
  end
end
