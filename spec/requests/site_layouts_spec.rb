require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe "SiteLayouts", type: :request do
  describe "layout links" do
    it "should work in home page" do
      get "/"
      assert_template 'static_pages/home'
      assert_select "a[href=?]", '/', count: 2
      assert_select "a[href=?]", '/about'
      assert_select "a[href=?]", '/help'
      assert_select "a[href=?]", '/contact'
    end
  end
end