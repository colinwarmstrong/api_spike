class GithubUser
  attr_reader :login,
              :image

  def initialize(user_data = {})
    @login = user_data[:login]
    @image = user_data[:avatar_url]
  end
end
