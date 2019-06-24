# frozen_string_literal: true

RSpec.describe Hash2lrtemplate do
  context 'when testing gem integrity' do
    it 'has a version number' do
      expect(Hash2lrtemplate::VERSION).not_to be(nil)
    end
  end
end
