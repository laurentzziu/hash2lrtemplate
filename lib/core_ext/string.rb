# frozen_string_literal: true

class String
  # https://apidock.com/rails/String/camelize
  def camelize(uppercase_first_letter = true)
    string = self
    string = if uppercase_first_letter
               string.sub(/^[a-z\d]*/) { $&.capitalize }
             else
               string.sub(/^(?:(?=\b|[A-Z_])|\w)/) { $&.downcase }
             end
    string.gsub(/(?:_|(\/))([a-z\d]*)/) { "#{$1}#{$2.capitalize}" }.gsub('/', '::')
  end

  # https://stackoverflow.com/a/27737214
  def titleize
    split(' ').map(&:capitalize).join(' ')
  end
end
