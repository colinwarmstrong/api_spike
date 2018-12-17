require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /following_activity' do
    it 'sees the recent public activity of the people they follow' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/received_events")
        .with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          })
        .to_return(status: 200, body: File.read('./spec/fixtures/following_activity.json'), headers: {})

      visit following_activity_path

      expect(page).to have_content('Recent Activity')
      expect(page).to have_css('.event', count: 25)

      within(first('.event')) do
        expect(page).to have_content('SSchwartz214 started watching the repository SSchwartz214/rales_engine on August 23, 2018')
        expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/30695131?']")
      end
    end
  end
end
