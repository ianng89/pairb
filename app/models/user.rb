class User < ActiveRecord::Base
  include Clearance::User

def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth['provider']
    user.uid = auth['uid']
    if auth['info']
      user.first_name = auth['info']['name'] || ""
      user.email = auth['info']['email'] || ""
    end
  end
end

  def password_optional?
    true
  end
end
