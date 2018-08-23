class User < ApplicationRecord
  validates_presence_of :provider, :uid, :name, :token, :login


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.token = auth['credentials']['token']
      user.login = auth['raw_info']['login']
      user.image = auth['raw_info']['avatar_url']
    end
  end
end
