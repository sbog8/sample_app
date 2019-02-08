require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#new" do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50)}
    
    it { should validate_presence_of(:email) }
    it { should validate_length_of(:email).is_at_most(255) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('user@example..com').for(:email) }
    
    it { should have_secure_password }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
