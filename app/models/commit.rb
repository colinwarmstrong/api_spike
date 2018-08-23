class Commit
  attr_reader :created_at,
              :author,
              :message,
              :repo
              
  def initialize(created_at, author, message, repo)
    @created_at = created_at
    @author = author
    @message = message
    @repo = repo
  end
end
