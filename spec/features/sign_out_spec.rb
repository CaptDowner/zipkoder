require 'spec_helper'

describe "Signing out" do

  it "removes the user id from the session" do
    user = User.create!(user_attributes)

    visit root_path

    click_button 'Sign In'   
    
    expect(current_path).to eq(session)
    
    fill_in "Email", with: 'captdowner@gmail.com'
    fill_in "Password", with: 'sailing'
    click_button "Sign In"

    expect(current_path).to eq(zips_path)

    click_button 'Sign Out'


#    expect(page).to have_text("signed out")
    expect(page).not_to have_link('Sign Out')
    expect(page).to have_link('Sign In')
  end

end
