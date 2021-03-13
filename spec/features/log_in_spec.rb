require "rails_helper"

RSpec.describe "LogIns", type: :feature do
  it "redirects to root_path if log-in is valid" do
    user = create(:user)
    visit new_session_path
    fill_in "Email address", with: user.email_address
    fill_in "Password", with: user.password
    click_button "Log in"

    expect(page).to have_current_path(root_path)
  end
end
