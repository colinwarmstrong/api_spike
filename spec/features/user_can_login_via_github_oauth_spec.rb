require 'rails_helper'

describe 'User visits /' do
  it 'they can login via Github oauth' do
    stub_omniauth

    stub_request(:get, "https://api.github.com/users/default_login/starred").
      with(
        headers: {
       'Accept'=>'*/*',
       'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
       'Authorization'=>'token 121313131423424235235123',
       'User-Agent'=>'Faraday v0.12.2'
        }).
      to_return(status: 200, body: File.read('./spec/mock_responses/starred_repos.json'), headers: {})

    visit root_path

    click_link 'Sign in with Github'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Signed in!')
    expect(page).to have_content('Welcome Colin Armstrong')
    expect(page).to have_link('Logout')
  end
end
