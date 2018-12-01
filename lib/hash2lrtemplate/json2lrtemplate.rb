# frozen_string_literal: true

module Hash2lrtemplate
  class JSON2lrtemplate
    attr_reader :json_string

    def self.call(json_string)
      new(json_string).call
    end

    def initialize(json_string)
      raise(StandardError, 'Invalid class. Expected class: `String`') unless json_string.is_a?(String)

      @json_string = json_string
    end

    def call
      convert
    end

    private

    # Transform `"keys"` to `keys` (remove quotes)
    # Transform `[]` to `{}` - works for values on the same line?
    # Transform `:` to `=`
    # Remove leading and ending `{}`
    # `,` before closing `}`
    #
    # @return [String]

    def convert
      @json_string.gsub(/"(\w+)"(?=:)/) { |_| $1.camelize(false) }
                  .gsub(/(\[[.\S\s^"]*?\])/) { |_| $1.tr('[]', '{}') }
                  .gsub(':', ' = ')
                  .sub(/\A{/, '').sub(/}\Z/, '')
                  .gsub(/(?<=.)(}){1}(?=.)?/) { |_| ",#{$1}" }
    end
  end
end
