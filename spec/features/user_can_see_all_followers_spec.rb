require 'rails_helper'

describe 'A user' do
  context 'visiting /followers' do
    it 'sees a list of all followers for the user' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      click_on 'Followers'

      expect(current_path).to eq('/followers')
      expect(page).to have_content('Followers')
      expect(page).to have_css('.follower', count: 3)

      within(first('.follower')) do
        expect(page).to have_content(:login)
        expect(page).to have_content(:image)
      end
    end
  end
end
