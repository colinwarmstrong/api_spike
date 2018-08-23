class Repo
  attr_reader :name,
              :description,
              :language,
              :forks_count,
              :updated_at

  def initialize(repo_info)
    @name = repo_info[:name]
    @description = repo_info[:description]
    @language = repo_info[:language]
    @forks_count = repo_info[:forks_count]
    @updated_at = Time.parse(repo_info[:updated_at])
  end
end
