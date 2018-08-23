require 'rails_helper'

describe 'A user' do
  context 'visiting /' do
    it 'sees a list of all their repos' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/repos").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>'token abc5ca1ae648f4ece58d9926c459f5dcabac848e',
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/mock_responses/repos.json'), headers: {})

      visit repos_path

      expect(page).to have_content('Repos')
      expect(page).to have_css('.repo', count: 30)

      within(first('.repo')) do
        expect(page).to have_content('battleship')
        expect(page).to have_content('A condensed REPL version of the board game Battleship that runs in the terminal.')
        expect(page).to have_content('Language: Ruby')
        expect(page).to have_content('Forks: 0')
        expect(page).to have_content('Last Updated On 06/10/2018')
      end
    end
  end
end
