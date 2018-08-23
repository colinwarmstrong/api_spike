require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /activity' do
    it 'sees their 25 most recent commits' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/events").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/fixtures/events.json'), headers: {})

      visit activity_path

      expect(page).to have_content('Recent Activity')
      expect(page).to have_css('.commit', count: 25)

      within(first('.commit')) do
        expect(page).to have_content("On August 17, 2018, #{user.name} added a commit to MacInnes/rails_engine")
        expect(page).to have_content("Make slight changes to the import_data rake task.")
      end
    end
  end
end
