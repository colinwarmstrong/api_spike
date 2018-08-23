class Organization
  attr_reader :name,
              :image
  def initialize(organization_info)
    @name = organization_info[:login]
    @image = organization_info[:avatar_url]
  end
end
