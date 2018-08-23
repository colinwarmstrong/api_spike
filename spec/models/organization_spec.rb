require 'rails_helper'

describe Organization, type: :model do
  it 'exists' do
    organization_info = {login: 'default_login', avatar_url: 'image.jpg'}

    expect(Organization.new(organization_info)).to be_an(Organization)
  end

  it 'has attributes' do
    organization_info = {login: 'default_login', avatar_url: 'image.jpg'}

    organization = Organization.new(organization_info)

    expect(organization.name).to eq(organization_info[:login])
    expect(organization.image).to eq(organization_info[:avatar_url])
  end
end
