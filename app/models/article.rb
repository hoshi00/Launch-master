class Article < ActiveRecord::Base
  validates :title, {presence: true}
  validates :image, {presence: true}
  validates :content, {presence: true}
  validates :lang, {presence: true}
  validates :url, {presence: true}

    belongs_to :user
    has_attached_file :image,
    styles:  { medium: "300x300#", thumb: "100x100#" }
    validates_attachment_content_type :image,
    content_type: ["image/jpg","image/jpeg","image/png"]

    # イイね
    has_many :likes, dependent: :destroy
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end

end