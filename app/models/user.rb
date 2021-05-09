class User < ApplicationRecord
  has_many :improvements, dependent: :destroy
  has_many :improvement_comments, dependent: :destroy

  def self.from_omniauth(auth)
    where(uid: auth["uid"]).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.email = auth["info"]["email"]
      user.name = auth["info"]["name"]
    end
  end

end
