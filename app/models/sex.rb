class Sex < ActiveRecord::Base
  self.table_name = "sex"

  validates_presence_of :code, :name

  validates_uniqueness_of :code

  has_many :pets
end