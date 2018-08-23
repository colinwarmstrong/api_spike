require 'rails_helper'

describe GithubUser, type: :model do
  it 'exists' do
    user_data = {login: 'default_login', avatar_url: 'image.jpg'}

    expect(GithubUser.new(user_data)).to be_a(GithubUser)
  end

  it 'has attributes' do
    user_data = {login: 'default_login', avatar_url: 'image.jpg'}

    github_user = GithubUser.new(user_data)

    expect(github_user.login).to eq(user_data[:login])
    expect(github_user.image).to eq(user_data[:avatar_url])
  end
end
