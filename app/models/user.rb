class User < ActiveRecord::Base
  has_many :mumbles
  has_many :comments

  validates :email, presence: true, uniqueness: true

  before_create :check_and_set_gravatar

  has_secure_password

  include Gravtastic
  is_gravtastic size: 300, default: :mm

  def check_and_set_gravatar
    self.profile_image_uri = self.gravatar_url unless self.profile_image_uri.present?
  end
end
