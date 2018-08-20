class User < ApplicationRecord

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['proivder']
      user.uid = auth['uid']
      user.name = auth['info']['name']
    end
  end
end
