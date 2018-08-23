require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /followers' do
    it 'sees a list of all followers for the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/followers").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/fixtures/followers.json'), headers: {})

      visit followers_path

      expect(page).to have_content('Followers')
      expect(page).to have_css('.follower', count: 7)

      within(first('.follower')) do
        expect(page).to have_css('.follower-login')
        expect(page).to have_css('.follower-image')
      end
    end
  end
end
