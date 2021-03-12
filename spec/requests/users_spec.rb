require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "#create" do
    context "when the request is valid" do
      before do
        post users_path, params: { user: attributes_for(:user).except(:auth_token) }
      end

      it "will create a new user if the request is valid" do
        expect(User.count).to eq(1)
      end

      it "will store the auth_token in the cookie" do
        expect(signed_cookie[:auth_token]).to eq(User.first.auth_token)
      end
    end

    it "returns an error if the request is invalid" do
      post users_path, params: { user: attributes_for(:user).except(:auth_token, :email_address) }

      expect(json.dig(:errors, :email_address)).to be_present
    end
  end
end
