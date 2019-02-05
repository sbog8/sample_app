require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: "Example User", email: "user@example.com") }

  describe "#new" do
    it "should be valid" do
      assert user.valid?
    end

    it "should return false if name's blank" do
      user.name = " "
      expect(user.valid?).to be_falsey
    end

    it "should return false if email's blank" do
      user.email = " "
      expect(user.valid?).to be_falsey
    end

    it "should return false if name's too long (>50)" do
      user.name = "a" * 51
      expect(user.valid?).to be_falsey
    end

    it "should return false if email's too long (>255)" do
      user.email = "a" * 244 + "@hotmail.com"
      expect(user.valid?).to be_falsey
    end
  end
end
