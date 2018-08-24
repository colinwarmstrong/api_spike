require 'rails_helper'

describe GithubUserService, type: :model do
  it 'exists' do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    expect(GithubUserService.new(user)).to be_a(GithubUserService)
  end

  context 'Instance Methods' do
    it '#api_call' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      stub_request(:get, "https://api.github.com/users/#{user.login}/repos")
        .with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',

         'Authorization'=>"token #{ENV['TEST_TOKEN']}",
         'User-Agent'=>'Faraday v0.12.2'
          })
        .to_return(status: 200, body: File.read('./spec/fixtures/repos.json'), headers: {})

      endpoint = 'repos'
      github_user_service = GithubUserService.new(user)

      repos = github_user_service.api_call(endpoint)
      repo = repos.first

      expect(repos).to be_a(Array)
      expect(repo).to be_a(Hash)
    end
  end
end
