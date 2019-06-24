# frozen_string_literal: true

require 'hash2lrtemplate/version'
require 'core_ext/string'
require 'callable_class'
require 'hash2lrtemplate/json2lrtemplate'
require 'hash2lrtemplate/convertor'
require 'hash2lrtemplate/extension'
require 'core_ext/hash'

module Hash2lrtemplate
  class Error < StandardError; end
end
