require 'rails_helper'

describe Repo, type: :model do
  it 'exists' do
    repo_info = {name: 'Colin',
                 description: 'Test Description',
                 language: 'Ruby',
                 forks_count: 12,
                 updated_at: '2018-03-08T18:56:13Z'}

    expect(Repo.new(repo_info)).to be_a(Repo)
  end

  it 'has_attributes' do
    repo_info = {name: 'Colin',
                 description: 'Test Description',
                 language: 'Ruby',
                 forks_count: 12,
                 updated_at: '2018-03-08T18:56:13Z'}

    repo = Repo.new(repo_info)

    expect(repo.name).to eq(repo_info[:name])
    expect(repo.description).to eq(repo_info[:description])
    expect(repo.language).to eq(repo_info[:language])
    expect(repo.forks_count).to eq(repo_info[:forks_count])
    expect(repo.updated_at).to eq(Time.parse(repo_info[:updated_at]))
  end
end
