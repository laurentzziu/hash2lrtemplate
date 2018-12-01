# frozen_string_literal: true

require 'securerandom'

RSpec.describe Hash2lrtemplate::Convertor do
  let(:empty_described_instance) { described_class.new({}) }
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
  let(:convertion_result) { described_class.new(demo_hash).call }
  let(:required_keys) { %w[id internalName title type value settings uuid] }

  context 'initializing' do
    context 'wrong argument' do
      it 'should raise `ArgumentError` when no params provided' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end

      it 'should raise `StandardError` with message when provided object is not a `Hash`' do
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
      context '@hash' do
        it 'should be of kind `Hash`' do
          expect(empty_described_instance.hash).to be_kind_of(Hash)
          expect(empty_described_instance).to have_attributes(hash: {})
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

    context 'instance#call vs class#call' do
      it 'should have identical results when called via instance or class method' do
        expect(described_class.call(demo_hash)).to eq(convertion_result)
      end
    end
  end
end
