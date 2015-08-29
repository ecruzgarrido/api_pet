class User < ActiveRecord::Base
  include SecureTools

  devise :database_authenticatable, :confirmable, :trackable,
         :registerable , :validatable

  validates_presence_of :name

  validates_uniqueness_of :authentication_token, allow_blank: true

  has_many :pets, dependent: :destroy

  def generate_authentication_token
    begin
      self.authentication_token = generate_token
    end while self.class.exists?(authentication_token: authentication_token)

    save!

    authentication_token
  end
end