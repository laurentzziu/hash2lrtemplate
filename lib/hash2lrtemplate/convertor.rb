# frozen_string_literal: true

require 'json'

module Hash2lrtemplate
  class Convertor
    include CallableClass

    attr_reader :hash

    def initialize(hash)
      raise Hash2lrtemplate::Error, 'Invalid class. Expected class: `Hash`.' unless hash.is_a?(Hash)

      @hash = hash
    end

    #
    # Converts the hash to JSON and call {Hash2lrtemplate::JSON2lrtemplate.call}
    #
    # @return [String] Converted string
    #
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
