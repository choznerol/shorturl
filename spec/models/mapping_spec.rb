require 'rails_helper'

RSpec.describe Mapping, type: :model do
  describe 'ActiveRecord Validations' do
    subject { Mapping.new(key: 'aa', target_url: 'https://google.com') }

    describe 'valid' do
      it { is_expected.to be_valid }
    end

    describe 'target_url' do
      describe 'validates presence' do
        before { subject.target_url = nil }

        it 'has errors on :target_url' do
          is_expected.not_to be_valid
          expect(subject.errors[:target_url][0]).to eq "can't be blank"
        end
      end

      describe 'validates valid URL regex' do
        before { subject.target_url = 'htttttp://google.com' }

        it 'has errors on :target_url' do
          is_expected.not_to be_valid
          expect(subject.errors[:target_url][0]).to eq "Valid URL required"
        end
      end
    end

    describe 'key' do
      describe 'validates length' do
        subject { Mapping.create!(key: 'aa', target_url: 'https://google.com') }

        context 'too short' do
          before { subject.key = 'a' }

          it 'has errors on :target_url' do
            is_expected.not_to be_valid
            expect(subject.errors[:key][0]).to eq 'is too short (minimum is 2 characters)'
          end
        end

        context 'too long' do
          before { subject.key = 'abcdabcdabcdabcd' }

          it 'has errors on :target_url' do
            is_expected.not_to be_valid
            expect(subject.errors[:key][0]).to eq 'is too long (maximum is 10 characters)'
          end
        end
      end
    end
  end

  describe 'ActiveRecord LifeCycle hook' do
    describe ':set_key' do
      subject { Mapping.create!(target_url: 'https://foo.com') }

      it 'sets :key automatically' do
        expect(subject.key).to be_a(String)
        expect(subject.key.length >= 2).to eq true
      end
    end
  end

  describe '::next_key' do
    it 'will change if new Mapping added' do
      next_key = Mapping.next_key
      Mapping.create!(key: 'foobar', target_url: 'https://gitlab.com')
      next_next_key = Mapping.next_key

      expect(next_key).not_to eq(next_next_key)
    end
  end
end
