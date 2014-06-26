require 'spec_helper'

describe "Signing in" do

  it "prompts for an email and password" do
    visit root_url

    click_button 'Sign In'

    expect(current_path).to eq(new_session_path)

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end

  it "signs in the user if the email/password combination is valid" do
    user = User.create!(user_attributes)

    visit root_url

    click_button 'Sign In'

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button 'Sign In'

    expect(current_path).to eq(zips_path)   

    expect(page).to have_text("Welcome back, #{user.firstname} #{user.lastname}!")
    expect(page).not_to have_button('Sign IIn')
    expect(page).not_to have_button('Sign Up')
    expect(page).to have_button('Sign Out')
  end

  it "does not sign in the user if the email/password combination is invalid" do
    user = User.create!(user_attributes)

    visit root_url

    click_button 'Sign In'

    fill_in "Email", with: 'captdowner@gmail.com'
    fill_in "Password", with: "no match"

    click_button 'Sign In'

    expect(page).to have_text('Invalid')

    expect(page).to have_button('Sign In')
    expect(page).to have_button('Register')
    expect(page).not_to have_button('Sign Out')
  end

  it "redirects to the intended page" do
    user = User.create!(user_attributes)

    visit new_session_path

    expect(current_path).to eq(new_session_path)   

    fill_in "Email", with: 'captdowner@gamil.com'
    fill_in "Password", with: 'sailing'
    click_button "Sign In"

    expect(current_path).to eq(session_path)
  end

end
