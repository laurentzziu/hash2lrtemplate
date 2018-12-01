# frozen_string_literal: true

require 'json'

module Hash2lrtemplate
  class Convertor
    attr_reader :hash

    def self.call(hash)
      new(hash).call
    end

    def initialize(hash)
      raise(StandardError, 'Invalid class. Expected class: `Hash`.') unless hash.is_a?(Hash)

      @hash = hash
    end

    def call
      convert
    end

    private

    def convert
      json_string = @hash.to_json
      Hash2lrtemplate::JSON2lrtemplate.call(json_string)
    end
  end
end
