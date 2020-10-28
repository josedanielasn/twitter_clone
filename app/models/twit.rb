class Twit < ApplicationRecord
  belongs_to :user
  has_many :retwits, foreign_key: :twit_id, class_name: "Retwit"
  validates :body, presence: true, length: { maximum: 280 }
end
