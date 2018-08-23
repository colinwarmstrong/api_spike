require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /' do
    it 'sees the number of starred repos for the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/starred").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/mock_responses/starred_repos.json'), headers: {})

      visit root_path

      within('.starred-repos') do
        expect(page).to have_content('Number of Starred Repos: 7')
      end
    end
  end
end
