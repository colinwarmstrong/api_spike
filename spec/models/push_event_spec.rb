require 'rails_helper'

describe PushEvent, type: :model do
  it 'exists' do
    created_at_1 = Time.now
    author_1 = 'ColinArmstrong'
    message_1 = 'Test commit'
    repo_1 = 'test_repo'

    created_at_2 = Time.now
    author_2 = 'BobbySmith'
    message_2 = 'Test commit 2'
    repo_2 = 'test_repo_2'

    commit_1 = Commit.new(created_at_1, author_1, message_1, repo_1)
    commit_2 = Commit.new(created_at_2, author_2, message_2, repo_2)

    push_event_info = {payload:
                        {commit: [commit_1, commit_2]},
                       repo:
                        {name: 'TestRepo'},
                       created_at: '2018-03-08T18:56:13Z'}

    expect(PushEvent.new(push_event_info)).to be_a(PushEvent)
  end

  it 'has_attributes' do
    created_at_1 = Time.now
    author_1 = 'ColinArmstrong'
    message_1 = 'Test commit'
    repo_1 = 'test_repo'

    created_at_2 = Time.now
    author_2 = 'BobbySmith'
    message_2 = 'Test commit 2'
    repo_2 = 'test_repo_2'

    commit_1 = Commit.new(created_at_1, author_1, message_1, repo_1)
    commit_2 = Commit.new(created_at_2, author_2, message_2, repo_2)

    push_event_info = {payload:
                        {commits: [commit_1, commit_2]},
                       repo:
                        {name: 'TestRepo'},
                       created_at: '2018-03-08T18:56:13Z'}

    push_event = PushEvent.new(push_event_info)

    expect(push_event.commits).to eq(push_event_info[:payload][:commits])
    expect(push_event.repo).to eq(push_event_info[:repo][:name])
    expect(push_event.created_at).to eq(Time.parse(push_event_info[:created_at]))
  end
end
