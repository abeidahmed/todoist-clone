require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "#create" do
    it "will create a new user if the request is valid" do
      post users_path, params: { user: attributes_for(:user).except(:auth_token) }

      expect(User.count).to eq(1)
    end

    it "will store the auth_token in the cookie if the request is valid" do
      post users_path, params: { user: attributes_for(:user).except(:auth_token) }

      expect(signed_cookie[:auth_token]).to eq(User.first.auth_token)
    end

    it "does not store the cookie if the request is invalid" do
      post users_path, params: { user: attributes_for(:user).except(:auth_token, :email_address) }

      expect(signed_cookie[:auth_token]).to be_blank
    end
  end
end
