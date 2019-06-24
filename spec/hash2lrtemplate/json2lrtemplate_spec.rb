# frozen_string_literal: true

require 'securerandom'

RSpec.describe Hash2lrtemplate::JSON2lrtemplate do
  let(:empty_described_instance) { described_class.new('') }
  let(:demo_hash) do
    {
      s: {
        id: SecureRandom.uuid.upcase,
        internal_name: 'Hash2lrtemplate test demo',
        title: 'Hash2lrtemplate test demo',
        type: 'Develop',
        value: {
          uuid: SecureRandom.uuid.upcase,
          settings: {
            'Blacks2012': -20,
            'Tint': 10,
            'ConvertToGrayscale': false,
            'CameraProfile': 'Adobe Standard',
            'ToneCurvePV2012Red': [
              0, 0, 57, 40, 144, 147, 196, 206, 255, 255
            ]
          }
        },
        version: 0
      }
    }
  end
  let(:demo_json_string) { demo_hash.to_json }
  let(:convertion_result) { described_class.new(demo_json_string).call }
  let(:required_keys) { %w[id internalName title type value settings uuid] }

  context 'when initializing' do
    context 'with wrong argument' do
      it 'raises `ArgumentError` when no params provided' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end

      it 'raises `StandardError` with message when provided object is not a `String`' do
        expect { described_class.new(nil) }.to raise_error(StandardError, /Invalid Class/i)
      end
    end

    context 'with correct argument' do
      it 'creates a new class instace' do
        expect(empty_described_instance).to be_kind_of(described_class)
      end
    end
  end

  context 'when testing encapsulation' do
    context 'when testing attributes' do
      context 'when testing @json_string' do
        it 'is kind of `String`' do
          expect(empty_described_instance.json_string).to be_kind_of(String)
        end

        it { expect(empty_described_instance).to have_attributes(json_string: '') }
      end
    end

    context 'when testing methods' do
      context 'when testing public methods' do
        context 'when testing class methods' do
          it 'responds to `#call`' do
            expect(described_class).to respond_to(:call)
          end
        end

        context 'when testing instance methods' do
          it 'responds to method `#call`' do
            expect(empty_described_instance).to respond_to(:call)
          end
        end
      end

      context 'when testing private methods' do
        it 'doesn\'t respond to `#convert`' do
          expect(empty_described_instance).not_to respond_to(:convert)
        end
      end
    end
  end

  context 'when testing conversion result' do
    context 'when testing data type' do
      it 'is kind of `String`' do
        expect(convertion_result).to be_kind_of(String)
      end
    end

    context 'when testing content' do
      it 'doesn\'t have `{` as first character' do
        expect(convertion_result[0]).not_to eq('{')
      end

      it 'has key `s` as first character' do
        expect(convertion_result[0]).to eq('s')
      end

      it 'has `}` as last character' do
        expect(convertion_result[-1]).to eq('}')
      end

      it 'doesn\'t contain `:`' do
        expect(convertion_result).not_to include(':')
      end

      it 'contains `=`' do
        expect(convertion_result).to include('=')
      end

      it 'includes required keys' do
        expect(convertion_result).to include(*required_keys)
      end
    end

    context 'when testing instance#call vs class#call' do
      it 'have identical results when called via instance or class method' do
        expect(described_class.call(demo_json_string)).to eq(convertion_result)
      end
    end
  end
end
