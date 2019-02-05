require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: "Example User", email: "usEr@example.com",
                            password: "fo234567", password_confirmation: "fo34567") }

  describe "#new" do
    # it "should be valid" do
    #   expect(user.valid?).to be_truthy
    # end

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50)}
    it { should validate_presence_of(:email) }

    # it "should return false if name is too long (>50)" do
    #   user.name = "a" * 51
    #   expect(user.valid?).to be_falsey
    # end

    # it "should return false if email is too long (>255)" do
    #   user.email = "a" * 244 + "@hotmail.com"
    #   expect(user.valid?).to be_falsey
    # end

    # it "should be true with a valid address" do
    #   valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
    #                      first.last@foo.jp alice+bob@baz.cn]
    #   valid_addresses.each do |valid_address|
    #     user.email = valid_address
    #     assert user.valid?, "#{valid_address.inspect} should be valid"
    #   end
    # end

    # it "should be false with invalid address" do
    #   invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    #                        foo@bar_baz.com foo@bar+baz.com foo@hi..com]
    #   invalid_addresses.each do |invalid_address|
    #     user.email = invalid_address
    #     expect(user.valid?).to be_falsey, "#{invalid_address.inspect} should be invalid"
    #   end
    # end

    # it "should return false if email isn't unique" do
    #   duplicate_user = user.dup
    #   duplicate_user.email = user.email.upcase
    #   user.save
    #   expect(duplicate_user.valid?).to be_falsey
    # end

    it { should have_secure_password }
    # it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
