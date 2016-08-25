class User < ApplicationRecord
  has_many :schools, through: :user_schools
  has_many :user_schools
end
