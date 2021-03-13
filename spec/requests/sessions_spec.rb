require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "#create" do
    it "signs in the user if the request is valid" do
      user = create(:user)
      post sessions_path, params: { email_address: user.email_address, password: user.password }

      expect(signed_cookie[:auth_token]).to eq(user.auth_token)
    end

    it "does not store the cookie if request is invalid" do
      post sessions_path, params: { email_address: "hello@ex.com", password: "secret" }

      expect(signed_cookie[:auth_token]).to be_blank
    end
  end
end
