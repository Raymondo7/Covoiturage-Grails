# app/models/user.rb
class User < ApplicationRecord
  # Include default Devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :first_name, :last_name
  has_many :reservations
  has_many :trips
  has_many :comments
    # ... autres associations ...
end
