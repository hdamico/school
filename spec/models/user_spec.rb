require 'rails_helper'

describe 'User', type: :model do
  describe 'validations' do
    let(:valid_resource) { build :user }
    let(:invalid_resource) { build :user, email: nil }

    it 'should be valid' do
      expect(valid_resource).to be_valid
    end

    it 'should be invalid with email nil' do
      expect(invalid_resource).to be_invalid
    end
  end
end
