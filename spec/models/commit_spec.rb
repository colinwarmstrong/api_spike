require 'rails_helper'

describe Commit, type: :model do
  it 'exists' do
    created_at = Time.now
    author = 'ColinArmstrong'
    message = 'Test commit'
    repo = 'test_repo'

    expect(Commit.new(created_at, author, message, repo)).to be_a(Commit)
  end

  it 'has attributes' do
    created_at = Time.now
    author = 'ColinArmstrong'
    message = 'Test commit'
    repo = 'test_repo'

    commit = Commit.new(created_at, author, message, repo)

    expect(commit.created_at).to eq(created_at)
    expect(commit.author).to eq(author)
    expect(commit.message).to eq(message)
    expect(commit.repo).to eq(repo)
  end
end
