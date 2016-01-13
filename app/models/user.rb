class User < ActiveRecord::Base
  include Clearance::User
  # validates :email, presence: true
  # validates_format_of :email, :with => /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/, message: "EMAIL NOT VALID", multiline: true
  # validates :first_name, presence: true
  has_many :properties

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
