require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /following' do
    it 'sees a list of all users they follow' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/following").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/fixtures/following.json'), headers: {})

      visit following_path

      expect(page).to have_content('Following')
      expect(page).to have_css('.following', count: 12)

      within(first('.following')) do
        expect(page).to have_css('.following-login')
        expect(page).to have_css('.following-image')
      end
    end
  end
end
