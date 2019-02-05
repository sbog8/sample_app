require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe "UsersSignups", type: :request do
  describe "#create" do
    it "should not create a user if there's invalid signup information" do
      get '/signup'
      expect do
        post users_path, params: { user: { name:  "",
                                          email: "user@invalid",
                                          password:              "foo",
                                          password_confirmation: "bar" } }
      end.to_not change{ User.count }
        assert_template 'users/new'
    end
  end
end
