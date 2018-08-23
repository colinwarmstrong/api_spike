class OrganizationsController < ApplicationController
  def index
    @organizations = GithubUserSearch.new(current_user).organizations
  end
end
