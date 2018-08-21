require 'rails_helper'

describe 'User visits /' do
  it 'they can login via Github oauth' do
    stub_omniauth

    visit root_path

    click_link 'Sign in with Github'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in!')
    expect(page).to have_content('Welcome Colin Armstrong')
    expect(page).to have_link('Logout')
  end
end
