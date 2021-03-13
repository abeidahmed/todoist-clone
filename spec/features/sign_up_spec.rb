require "rails_helper"

RSpec.describe "SignUps", type: :feature do
  it "redirects to root_path if sign-up is valid" do
    visit new_user_path
    fill_in "Your name", with: "John Doe"
    fill_in "Email address", with: "john@ex.com"
    fill_in "Password", with: "secretpassword"
    click_button "Sign up"

    expect(page).to have_current_path(root_path)
  end

  it "shows error message if fields are invalid" do
    visit new_user_path
    fill_in "Email address", with: "john@ex.com"
    fill_in "Password", with: "secretpassword"
    click_button "Sign up"

    expect(page).to have_text("can't be blank")
  end
end
