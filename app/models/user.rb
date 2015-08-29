class User < ActiveRecord::Base

  validates_presence_of :name, :email

  validates_uniqueness_of :email, case_sensitive: false

  has_many :pets, dependent: :destroy
end