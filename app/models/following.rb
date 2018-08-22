class Following
  attr_reader :login,
              :image

  def initialize(following_data = {})
    @login = following_data[:login]
    @image = following_data[:avatar_url]
  end
end
