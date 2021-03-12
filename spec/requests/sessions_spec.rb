require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "#create" do
    it "signs in the user if the request is valid" do
      user = create(:user)
      post sessions_path, params: { email_address: user.email_address, password: user.password }

      expect(signed_cookie[:auth_token]).to eq(user.auth_token)
    end

    it "returns an error if the request is invalid" do
      post sessions_path, params: { email_address: "", password: "helloworld" }

      expect(json.dig(:errors, :invalid)).to be_present
    end
  end
end
