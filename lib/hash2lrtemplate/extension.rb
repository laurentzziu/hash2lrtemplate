# frozen_string_literal: true

module Hash2lrtemplate
  # This module is meant to be included in the `Hash` class
  module Extension
    #
    # Convert the hash to +.lrtemplate+
    #
    # @return [String] Converted string
    #
    def to_lrtemplate
      Hash2lrtemplate::Convertor.call(self)
    end
  end
end
