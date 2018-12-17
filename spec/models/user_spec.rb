require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :provider }
    it { should validate_presence_of :uid }
    it { should validate_presence_of :name }
    it { should validate_presence_of :token }
    it { should validate_presence_of :login }
  end
end
