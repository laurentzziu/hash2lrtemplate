# frozen_string_literal: true

require 'securerandom'

RSpec.describe Hash2lrtemplate::JSON2lrtemplate do
  let(:empty_described_instance) { described_class.new("") }
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

    context 'initializing' do
    context 'wrong argument' do
      it 'should raise `ArgumentError` when no params provided' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end

      it 'should raise `StandardError` with message when provided object is not a `String`' do
        expect { described_class.new(nil) }.to raise_error(StandardError, /Invalid Class/i)
      end
    end

    context 'correct argument' do
      it 'should create a new class instace' do
        expect(empty_described_instance).to be_kind_of(described_class)
      end
    end
  end

  context 'encapsulation' do
    context 'attributes' do
      context '@json_string' do
        it 'should be of kind `String`' do
          expect(empty_described_instance.json_string).to be_kind_of(String)
          expect(empty_described_instance).to have_attributes(json_string: '')
        end
      end
    end

    context 'methods' do
      context 'public methods' do
        context 'class methods' do
          it 'should respond to `#call`' do
            expect(described_class).to respond_to(:call)
          end
        end

        context 'instance methods' do
          it 'should respond to method `#call`' do
            expect(empty_described_instance).to respond_to(:call)
          end
        end
      end

      context 'private methods' do
        it 'should not respond to `#convert`' do
          expect(empty_described_instance).to_not respond_to(:convert)
        end
      end
    end
  end

  context 'conversion result' do
    context 'data type' do
      it 'should be of kind `String`' do
        expect(convertion_result).to be_kind_of(String)
      end
    end

    context 'content' do
      it 'should not have `{` as first character' do
        expect(convertion_result[0]).to_not eq('{')
      end

      it 'should have key `s` as first character' do
        expect(convertion_result[0]).to eq('s')
      end

      it 'should have `}` as last character' do
        expect(convertion_result[-1]).to eq('}')
      end

      it 'should not contain `:`' do
        expect(convertion_result).to_not include(':')
      end

      it 'should contain `=`' do
        expect(convertion_result).to include('=')
      end

      it 'should include required keys' do
        expect(convertion_result).to include(*required_keys)
      end
    end

    context 'instance#call vs class#call' do
      it 'should have identical results when called via instance or class method' do
        expect(described_class.call(demo_json_string)).to eq(convertion_result)
      end
    end
  end
end
