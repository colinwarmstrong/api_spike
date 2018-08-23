class GithubUserService
  def initialize(user)
    @login = user.login
    @token = user.token
  end

  def api_call(endpoint)
    parse_json(endpoint)
  end

  private

  def conn
    Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.headers['Authorization'] = "token #{@token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def call(endpoint)
    conn.get("/users/#{@login}/#{endpoint}")
  end

  def parse_json(endpoint)
    JSON.parse(call(endpoint).body, symbolize_names: true)
  end
end
