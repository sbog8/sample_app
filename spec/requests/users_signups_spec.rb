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
  
  it "should increase users count by 1 with a valid user" do
    get '/signup'
    expect do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end.to change{ User.count }.by(1)
    follow_redirect!
    assert_template 'users/show'
  end
end
