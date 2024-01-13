class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :body, presence: true
  validates :rating, inclusion: { in: 1..5 }
end