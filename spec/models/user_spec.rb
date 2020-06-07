require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
  end

  describe 'instance methods' do
    it 'can create an api key' do
      user = User.create!(email: 'moredata@overload.com',
                          password: 'nonsense',
                          password_confirmation: 'nonsense')

      expect(user.api_key).to be_nil

      user.create_api_key

      expect(user.api_key).to_not be_nil
      expect(user.api_key).to be_a(String)
    end
  end
end
