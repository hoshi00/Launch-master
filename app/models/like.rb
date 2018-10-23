class Like < ActiveRecord::Base
  validates :user_id, {presence: true}
  validates :article_id, {presence: true}
end