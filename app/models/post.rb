class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
  # Remember to create a migration!
  has_many :post_tags
  has_many :tags, through: :post_tags
end
