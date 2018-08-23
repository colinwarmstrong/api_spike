require 'rails_helper'

describe 'An authorized user' do
  context 'visiting /orgs' do
    it 'sees a list of all organizations they are a part of' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/orgs").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>'token abc5ca1ae648f4ece58d9926c459f5dcabac848e',
         'User-Agent'=>'Faraday v0.12.2'
          }).
        to_return(status: 200, body: File.read('./spec/mock_responses/orgs.json'), headers: {})

      visit organizations_path

      expect(page).to have_content('Organizations')
      expect(page).to have_css('.organization', count: 2)

      within(first('.organization')) do
        expect(page).to have_content('JumpstartLab')
        expect(page).to have_css("img[src*='https://avatars1.githubusercontent.com/u/856601?v=4']")
      end
    end
  end
end
