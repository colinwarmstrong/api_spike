class UsersController < ApplicationController
  def new
    @starred_repos = GithubUserSearch.new(current_user).starred_repos if current_user
  end
end
